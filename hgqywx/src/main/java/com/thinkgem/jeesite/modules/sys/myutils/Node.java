package com.thinkgem.jeesite.modules.sys.myutils;

import java.util.List;

import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;

public  class Node {

    public String id;
    public String pid;
    public String name;
    public List<Node> children;
    public String type;//1 部门 ；2 用户；3 角色
    public String photo;//头像
    public int layer;
    
    
    public int getLayer() {
		return layer;
	}

	public void setLayer(int layer) {
		this.layer = layer;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Node() {
		this.type="3";
    }

    public Node(String id, String pid, String name) {
        super();
        this.id = id;
        this.pid = pid;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public List<Node> getChildren() {
        return children;
    }

    public void setChildren(List<Node> children) {
        this.children = children;
    }
    public static Node convertToNode(Office office) {
    	
    	Node node=new Node();
		node.setId(office.getId());
		node.setPid(office.getParentId());
		node.setName(office.getName());
		node .setType("1");
		return node;
    	
    }
public static Node convertToNode1(Office office) {
    	
    	Node node=new Node();
		node.setId(office.getId());
		node.setPid("0");
		node.setName(office.getName());
		node .setType("1");
		return node;
    	
    }
    
    //转换角色为节点
    public static Node convertToNode(Role role) {
    	Node node=new Node();
    	node.setId(role.getId());
    	node.setPid("0");
    	node.setName(role.getName());
    	node.setType("3");
    	return node;
    }
    public static Node convertToNodeAndLayer(Office office,int layer) {
    	
    	Node node=convertToNode(office);
    	node.setLayer(layer);
		return node;
    	
    }
	public static Node convertUserToNode(User user) {
    	
    	Node node=new Node();
		node.setId(user.getId());
		if(user.getOffice()!=null) {
			node.setPid(user.getOffice().getId());
		}else {
			node.setPid("0");
		}
		node.setType("2");
		node.setName(user.getName());
		node.setPhoto(user.getPhoto());
		return node;
    }
	
public static Node convertUserToNode(User user,Role role) {
    	
    	Node node=new Node();
		node.setId(user.getId());
		if(user.getRole()!=null) {
			node.setPid(role.getId());
		}else {
			node.setPid("0");
		}
		node.setType("2");
		node.setName(user.getName());
		node.setPhoto(user.getPhoto());
		return node;
    }
public static Node convertUserToNode(User user,Office office) {
	
	Node node=new Node();
	node.setId(user.getId());
	if(user.getOffice()!=null) {
		node.setPid(office.getId());
	}else {
		node.setPid("0");
	}
	node.setType("2");
	node.setName(user.getName());
	node.setPhoto(user.getPhoto());
	return node;
}
public static Node convertUserToNodeAndLayer(User user,int layer) {
    	
		Node node=convertUserToNode(user);
		node.setLayer(layer);
		return node;
    }

public static Node convertUserToNodeAndLayer1(User user,int layer,Role role) {
	
	Node node=convertUserToNode(user,role);
	node.setLayer(layer);
	return node;
}
public static Node convertUserToNodeAndLayerOff(User user,int layer,Office office) {
	
	Node node=convertUserToNode(user,office);
	node.setLayer(layer);
	return node;
}
	public static boolean isEndNode(Node node) {
		
		
		if(node.children==null) {
			return true;
		}else {
			return false;
		}
		
	}
}