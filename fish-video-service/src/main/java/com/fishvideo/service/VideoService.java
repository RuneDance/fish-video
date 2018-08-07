package com.fishvideo.service;

import com.fishvideo.pojo.Comments;
import com.fishvideo.pojo.Videos;
import com.fishvideo.utils.PagedResult;

import java.util.List;

public interface VideoService {

    /**
     * 保存视频
     *
     * @param video
     * @return
     */
    String saveVideo(Videos video);

    /**
     * 修改视频的封面
     *
     * @param videoId
     * @param coverPath
     */
    void updateVideo(String videoId, String coverPath);

    /**
     * 分页查询视频列表
     *
     * @param video
     * @param isSaveRecord
     * @param page
     * @param pageSize
     * @return
     */
    PagedResult getAllVideos(Videos video, Integer isSaveRecord,
                             Integer page, Integer pageSize);

    /**
     * 查询我喜欢的视频列表
     *
     * @param userId
     * @param page
     * @param pageSize
     * @return
     */
    PagedResult queryMyLikeVideos(String userId, Integer page, Integer pageSize);

    /**
     * 查询我关注的人的视频列表
     *
     * @param userId
     * @param page
     * @param pageSize
     * @return
     */
    PagedResult queryMyFollowVideos(String userId, Integer page, Integer pageSize);

    /**
     * 获取热搜词列表
     *
     * @return
     */
    List<String> getHotwords();

    /**
     * 用户喜欢/点赞视频
     *
     * @param userId
     * @param videoId
     * @param videoCreaterId
     */
    void userLikeVideo(String userId, String videoId, String videoCreaterId);

    /**
     * 用户不喜欢/取消点赞视频
     *
     * @param userId
     * @param videoId
     * @param videoCreaterId
     */
    void userUnLikeVideo(String userId, String videoId, String videoCreaterId);

    /**
     * 用户留言
     *
     * @param comment
     */
    void saveComment(Comments comment);

    /**
     * 留言分页
     *
     * @param videoId
     * @param page
     * @param pageSize
     * @return
     */
    PagedResult getAllComments(String videoId, Integer page, Integer pageSize);
}


