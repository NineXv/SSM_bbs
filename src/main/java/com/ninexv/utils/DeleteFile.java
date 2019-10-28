package com.ninexv.utils;

import java.io.File;

public class DeleteFile {
    public void deleteFailedUser(String fileName){
        File file = new File(fileName);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                System.out.println("删除注册失败用户的文件" + fileName + "成功！");
            } else {
                System.out.println("删除注册失败用户的文件" + fileName + "失败！");
            }
        } else {
            System.out.println("删除注册失败用户的文件失败：" + fileName + "不存在！");
        }
    }
}
