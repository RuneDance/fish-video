package com.fishvideo.mapper;

import com.fishvideo.pojo.Comments;
import com.fishvideo.pojo.vo.CommentsVO;
import com.fishvideo.utils.MyMapper;

import java.util.List;

public interface CommentsMapperCustom extends MyMapper<Comments> {

    List<CommentsVO> queryComments(String videoId);
}