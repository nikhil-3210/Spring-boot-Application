package com.nikhil.topicController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TopicController {
	
	@Autowired
	private TopicService topicservice;
	
	@RequestMapping(value = "/topics")
	public List<Topic> getAllTopics() {
		
		return topicservice.getAllTopics();
	}
	
	@RequestMapping(value = "/topics/{id}")
	public Topic geTopic(@PathVariable("id") String id) {
		return topicservice.getTopic(id);
	}
	
	@RequestMapping(value = "/topics", method = RequestMethod.POST)
	public void addTopic(@RequestBody Topic topic) {
		topicservice.addTopic(topic);
		
	}
	
	@RequestMapping(value = "/topics/{id}", method = RequestMethod.PUT)
	public void updateTopic(@RequestBody Topic topic, @PathVariable("id") String id) {
		topicservice.updateTopic(id, topic);
		
	}
	
	@RequestMapping(value = "/topics/{id}", method = RequestMethod.DELETE)
	public void deleteTopic(@PathVariable("id") String id) {
		topicservice.deleteTopic(id);
		
	}
}
