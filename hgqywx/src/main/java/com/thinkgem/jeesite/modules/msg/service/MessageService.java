/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.msg.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.msg.entity.Message;
import com.thinkgem.jeesite.modules.msg.dao.MessageDao;

/**
 * 各种消息所需字段Service
 * @author szx
 * @version 2018-09-06
 */
@Service
@Transactional(readOnly = true)
public class MessageService extends CrudService<MessageDao, Message> {

	public Message get(String id) {
		return super.get(id);
	}
	
	public List<Message> findList(Message message) {
		return super.findList(message);
	}
	
	public Page<Message> findPage(Page<Message> page, Message message) {
		return super.findPage(page, message);
	}
	
	@Transactional(readOnly = false)
	public void save(Message message) {
		super.save(message);
	}
	
	@Transactional(readOnly = false)
	public void delete(Message message) {
		super.delete(message);
	}
	
}