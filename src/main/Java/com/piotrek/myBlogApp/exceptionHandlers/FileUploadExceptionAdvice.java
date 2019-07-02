package com.piotrek.myBlogApp.exceptionHandlers;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

@ControllerAdvice
public class FileUploadExceptionAdvice {

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public String handleUploadSizeExceededException(
            MaxUploadSizeExceededException exc
    ) {



        return "redirect:/user/avatar?fileSizeError=true&userId=2";
    }
}
