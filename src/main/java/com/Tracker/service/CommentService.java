package com.Tracker.service;

import com.Tracker.entity.Comment;
import com.Tracker.repository.CommentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepo commentRepo;

    public Comment saveComment(Comment comment) {
        return commentRepo.save(comment);
    }

    public List<Comment> findAllCommentsByIdIssue(int id) {
        return commentRepo.findAllCommentsByIdIssue(id);
    }
}
