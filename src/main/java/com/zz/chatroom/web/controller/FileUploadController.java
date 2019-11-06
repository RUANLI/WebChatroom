package com.zz.chatroom.web.controller;

import javax.servlet.http.HttpServletRequest;

import com.zz.chatroom.service.FileUploadService;
import com.zz.chatroom.util.ResponseJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
/**
 * 文件上传
 */
@Controller
@RequestMapping("/chatroom")
public class FileUploadController {

    @Autowired
    private FileUploadService fileUploadService;
    
    @RequestMapping("/upload")
    @ResponseBody 
    public ResponseJson upload(
            @RequestParam(value = "file", required = true) MultipartFile file, HttpServletRequest request) {
        return fileUploadService.upload(file, request);
    }
}
