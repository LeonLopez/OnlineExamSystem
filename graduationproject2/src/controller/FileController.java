package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import po.Myfile;
import po.Pagination;
import service.FileService;
import vo.FileListVo;
import vo.TaotiListVo;

@Controller
public class FileController {

	@Autowired
	private FileService fileService;

	@RequestMapping("/managerGetFileList.action")
	public @ResponseBody Map<String, Object> managerGetFileList(Pagination pagination, HttpServletRequest request,
			String filename) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<FileListVo> list = fileService.getFileList(filename);
		List<FileListVo> list2 = fileService.getFileListByLimit(pagination, filename);
		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}

	@RequestMapping("/getFileList.action")
	public String getFileList(HttpServletRequest request, String filename) throws Exception {
		List<FileListVo> fileList = fileService.getFileList(filename);
		request.setAttribute("fileList", fileList);
		return "forward:/jsp/knowledgeRepository.jsp";
	}

	@RequestMapping(value = "/uploadFile.action", method = RequestMethod.POST)
	public @ResponseBody String upload(MultipartFile file, HttpServletRequest request) throws IOException {

		System.out.println("**************************正在执行上传函数");
		String path = request.getSession().getServletContext().getRealPath("upload");
		String fileName = file.getOriginalFilename();
		System.out.println(path);
		System.out.println(fileName);
		File dir = new File(path, fileName);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		// MultipartFile自带的解析方法
		file.transferTo(dir);

		Myfile myfile = new Myfile(fileName, new Date(), (Integer) request.getSession().getAttribute("managerId"));
		fileService.addFile(myfile);
		return "success";
	}

	@RequestMapping("/downloadFile.action")
	public void down(HttpServletRequest request, HttpServletResponse response, String filename) throws Exception {

		String fileName = request.getSession().getServletContext().getRealPath("upload") + "\\" + filename;
		// 获取输入流
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));

		// 转码，免得文件名中文乱码
		filename = URLEncoder.encode(filename, "UTF-8");
		// 设置文件下载头
		response.addHeader("Content-Disposition", "attachment;filename=" + filename);
		// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int len = 0;
		while ((len = bis.read()) != -1) {
			out.write(len);
			out.flush();
		}
		out.close();
	}

	@RequestMapping("/managerDeleteFile.action")
	public @ResponseBody String managerDeleteFile(@RequestBody String idsStr, HttpServletRequest request)
			throws Exception {
		String[] ids = idsStr.split(",");
		for (int i = 0; i < ids.length; i++) {
			String filename = fileService.getFileById(Integer.parseInt(ids[i])).getFilename();
			String fileName = request.getSession().getServletContext().getRealPath("upload") + "\\" + filename;
            System.out.println("***********************"+fileName);
			if (fileName != null && fileName != "") {
				File file = new File(fileName);
				if (file.exists()) {
					boolean successornot = file.delete();
					System.out.println("********************************successornot"+successornot);
				}
			}
			fileService.deleteFileById(Integer.parseInt(ids[i]));
		}
		return "success";
	}
}
