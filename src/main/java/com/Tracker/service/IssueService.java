package com.Tracker.service;

import com.Tracker.entity.Issue;
import com.Tracker.repository.IssueRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class IssueService {
    @Autowired
    private IssueRepo issueRepo;

    @Transactional
    public List<Issue> findAll() {
        return issueRepo.findAll();
    }

    public Issue findById(int id){
        return issueRepo.findById(id);
    }

    public Issue saveIssue(Issue issue) {
        return issueRepo.save(issue);
    }

    @Transactional
    public int updateIssueById(String status, int id){
        return issueRepo.updateIssueById(status, id);
    }
}
