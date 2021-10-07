package com.Tracker.repository;

import com.Tracker.entity.Issue;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface IssueRepo extends CrudRepository<Issue, Long> {
    List<Issue> findAll();

    Issue findById(int id);

    Issue save(Issue issue);

    @Modifying
    @Query(
            value = "UPDATE ISSUES SET STATUS = ? WHERE id = ?",
            nativeQuery = true
    )

    int updateIssueById(String status, int id);
}
