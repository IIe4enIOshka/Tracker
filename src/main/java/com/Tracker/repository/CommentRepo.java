package com.Tracker.repository;

import com.Tracker.entity.Comment;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CommentRepo extends CrudRepository<Comment, Long> {
    Comment save(Comment comment);

    @Query(
            value = "SELECT * FROM comments WHERE id_issue = ?",
            nativeQuery = true
    )

    List<Comment> findAllCommentsByIdIssue(int id);
}
