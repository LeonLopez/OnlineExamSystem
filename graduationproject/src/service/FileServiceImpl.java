package service;

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
	public List<FileListVo> getFileList() {
		return myfileMapper.getFileList();
	}

	@Override
	public List<FileListVo> getFileListByLimit(Pagination pagination) {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		return myfileMapper.getFileListByLimit(pagination);
	}

	@Override
	public void deleteFileById(int id) {
		myfileMapper.deleteByPrimaryKey(id);
	}
	
	
	
}
