package service;

import java.util.List;

import po.Myfile;
import po.Pagination;
import vo.FileListVo;

public interface FileService {

	void addFile(Myfile myfile);

	List<FileListVo> getFileList(String filename);

	List<FileListVo> getFileListByLimit(Pagination pagination, String filename);

	void deleteFileById(int id);

	Myfile getFileById(int id);


}
