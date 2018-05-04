package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.MyfileMapper;
import po.Myfile;
import po.Pagination;
import vo.FileListVo;


@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private MyfileMapper myfileMapper;

	@Override
	public void addFile(Myfile myfile) {
		myfileMapper.insertSelective(myfile);
		
	}

	@Override
	public List<FileListVo> getFileList(String filename) {
		return myfileMapper.getFileList(filename);
	}

	@Override
	public List<FileListVo> getFileListByLimit(Pagination pagination, String filename) {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		HashMap <String,Object> map=new HashMap<String,Object>();

		map.put("startPage",pagination.getStartPage());

		map.put("rows",pagination.getRows());
		
		map.put("filename",filename);

		return myfileMapper.getFileListByLimit(map);
	}

	@Override
	public void deleteFileById(int id) {
		myfileMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Myfile getFileById(int id) {
		return myfileMapper.selectByPrimaryKey(id);
	}

	
	
	
}
