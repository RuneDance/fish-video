package com.fishvideo.mapper;

import com.fishvideo.pojo.SearchRecords;
import com.fishvideo.utils.MyMapper;

import java.util.List;

public interface SearchRecordsMapper extends MyMapper<SearchRecords> {

    List<String> getHotwords();
}