package service;

import java.util.List;

import po.Myfile;
import po.Pagination;
import vo.FileListVo;

public interface FileService {

	void addFile(Myfile myfile);

	List<FileListVo> getFileList();

	List<FileListVo> getFileListByLimit(Pagination pagination);

	void deleteFileById(int id);

}
