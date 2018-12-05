/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.TreeService;
import com.thinkgem.jeesite.modules.sys.dao.OfficeDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.myutils.Node;
import com.thinkgem.jeesite.modules.sys.myutils.TreeBuilder;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 机构Service
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class OfficeService extends TreeService<OfficeDao, Office> {
	@Autowired
	private SystemService sysService;
	public List<Office> findAll(){
		return UserUtils.getOfficeList();
	}

	public List<Office> findList(Boolean isAll){
		if (isAll != null && isAll){
			return UserUtils.getOfficeAllList();
		}else{
			return UserUtils.getOfficeList();
		}
	}
	
	@Transactional(readOnly = true)
	public List<Office> findList(Office office){
		if(office != null){
			office.setParentIds(office.getParentIds()+"%");
			return dao.findByParentIdsLike(office);
		}
		return  new ArrayList<Office>();
	}
	
	@Transactional(readOnly = false)
	public void save(Office office) {
		super.save(office);
		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}
	@Transactional(readOnly = false)
	public void updateFromWeiXin(Office office) {
		Office office2=dao.get(office.getId());
		office2.setSort(office.getSort());
		office2.setName(office.getName());
		office2.setParentIds(office.getParentIds());
		save(office2);
	}
	@Transactional(readOnly = false)
	public void delete(Office office) {
		super.delete(office);
		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}
	
	public List<Node> getOfficeAndUser(List<Node> nodes){
		TreeBuilder builder=new TreeBuilder(nodes);
		 List<Node> treeNodes = new ArrayList<Node>();
	        List<Node> rootNodes = builder.getRootNodes();
	        for (Node rootNode : rootNodes) {
	        	buildChildNodes(rootNode,builder);
	            treeNodes.add(rootNode);
	        }
	    return treeNodes;
	}
	/**
	 * 
	 * @param nodes
	 * @param office 得到部门用户
	 * @return
	 */
	public List<Node> getOfficeUser(List<Node> nodes,Office office){
		TreeBuilder builder=new TreeBuilder(nodes);
		//builder.buildJSONTree();
		 List<Node> treeNodes = new ArrayList<Node>();
	        List<Node> rootNodes = builder.getRootNodes();
	        
	        List<Office> list = findList(true);
			List<Node> nodes2 = new ArrayList<Node>();
			for(int j=0;j<list.size();j++) {
				Node node=new Node();
				node=Node.convertToNode(list.get(j));
				nodes2.add(node);
			}
			TreeBuilder builder2=new TreeBuilder(nodes2);
			
	        for (Node rootNode : rootNodes) {
	        	buildChildNodesOff(rootNode,builder2,office);
	            treeNodes.add(rootNode);
	        }
	    return treeNodes;
	}
	
	
	public List<Node> getRoleAndUser(List<Node> nodes,Role role){
		TreeBuilder builder=new TreeBuilder(nodes);
		//builder.buildJSONTree();
		 List<Node> treeNodes = new ArrayList<Node>();
	        List<Node> rootNodes = builder.getRootNodes();
	        for (Node rootNode : rootNodes) {
	        	buildChildNodes1(rootNode,builder,role);
	            treeNodes.add(rootNode);
	        }
	    return treeNodes;
	}
	
	
	 // 递归子节点
	@Transactional(readOnly = false)
    public void buildChildNodes(Node node,TreeBuilder bulider) {
        List<Node> children =bulider.getChildNodes(node);
        if (!children.isEmpty()) {
            for (Node child : children) {
            	buildChildNodes(child,bulider);
            }
        }
    	List<Node> nodesUser=new ArrayList<Node>();
    	List<User>userList=sysService.findUserByOfficeId(node.getId());
    	for(User user:userList){
    		if(user.isAdmin()) continue;
    		children.add(Node.convertUserToNodeAndLayer(UserUtils.get(user.getId()),node.getLayer()+1));
    		
    	}
        node.setChildren(children);
    }
	
	// 递归子节点
		@Transactional(readOnly = false)
	    public void buildChildNodes1(Node node,TreeBuilder bulider,Role role) {
	        List<Node> children =bulider.getChildNodes(node);
	        if (!children.isEmpty()) {
	            for (Node child : children) {
	            	buildChildNodes(child,bulider);
	            }
	        }else{
	        	List<Node> nodesUser=new ArrayList<Node>();
	        	List<User>userList=sysService.finduser(new User(new Role(role.getId())));
	        	for(User user:userList){
	        		children.add(Node.convertUserToNodeAndLayer1(UserUtils.get(user.getId()),node.getLayer()+1,role));
	        	}
	        }
	        node.setChildren(children);
	    }
		
		// 递归子节点
		@Transactional(readOnly = false)
	    public void buildChildNodesOff(Node node,TreeBuilder bulider,Office office) {
	        List<Node> children =bulider.getChildNodes(node);
	        if (!children.isEmpty()) {
	            for (Node child : children) {
	            	buildChildNodesOff(child,bulider,office);
	            }
	        }
	        List<Node> currentNode=new ArrayList<Node>();
        	List<User>userList=sysService.findUserByOfficeId(node.getId());
        	for(User user:userList){
        		currentNode.add(Node.convertUserToNodeAndLayerOff(UserUtils.get(user.getId()),node.getLayer()+1,office));
        	}
        	if(currentNode.size()>0) children.addAll(0, currentNode);
	        node.setChildren(children);
	    }
}
