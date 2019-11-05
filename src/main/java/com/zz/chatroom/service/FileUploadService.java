package com.zz.chatroom.service;

import javax.servlet.http.HttpServletRequest;

import com.zz.chatroom.util.ResponseJson;
import org.springframework.web.multipart.MultipartFile;


public interface FileUploadService {

    ResponseJson upload(MultipartFile file, HttpServletRequest request);
}
