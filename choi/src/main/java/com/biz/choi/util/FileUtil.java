package com.biz.choi.util;

import java.io.*;
import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import com.biz.choi.vo.FileVO;


public class FileUtil {

	// 단일 파일 저장이름 생성 함수
	public String rename(String path, String oldName) {

	
		
		int count = 0;
		String tmpName = oldName;
		int len = tmpName.lastIndexOf(".");
		// .을 기준으로 앞의 문자열과 뒤의 확장자를 분리
		String preStr = tmpName.substring(0, len);
		String suffStr = tmpName.substring(len);
		
		File file = new File(path, oldName);
		while(file.exists()) {
			
			count++;
			
			// 파일 이름을 다시 만든다.
			oldName = preStr + "(" + count + ")" + suffStr;
			
			// 새로 만들어진 이름으로 이 파일도 존재하는지를 검사한다.
			file = new File(path, oldName);
		}
		
		return oldName;
	}
	
	// 다중파일 업로드 처리함수
	public ArrayList<FileVO> saveProc(MultipartFile[] file, int bno, String dir) {
		// 파일 저장이름들을 기억할 변수
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		
		// 저장 경로 지정
		String path = this.getClass().getResource("").getPath();
		path = path.substring(0, path.indexOf("/WEB-INF")) + "/WEB-INF/resources" + dir;
		
		try{
			for(int i = 0 ; i < file.length ; i++) {
				FileVO fVO = new FileVO();
				// 파일 원본이름을 알아낸다.
				String oriName = file[i].getOriginalFilename();
				// 만약 뷰에서 이 태그를 비워서 전송했다면 이 작업은 건너뛰고 다음파일 작업을 해야한다.
				if(oriName == null) {
					continue;
				}
				
				// 이 이름의 파일이 존재하는지 검사한다.
				String saveName = rename(path, oriName);
				
				// 이제 임시로 업로드된 파일을 실제 저장 경로에 저장한다.
				// 그리고 데이터베이스에 저장할 데이터들을 기억시킨다.
				fVO.setOriname(oriName);
				fVO.setSavename(saveName);
				fVO.setLen(file[i].getSize());
				fVO.setDir(dir);
				fVO.setBno(bno);
				
				// 리스트에 파일정보를 추가해준다.
				list.add(fVO);
				
				// 실제 저장경로에 저장한다.
				File tmp = new File(path, saveName);
				file[i].transferTo(tmp); // 실제저장 실행 함수
			}
		} catch(Exception e) {}
		
		// 리스트 반환하고
		return list;
	}

}
