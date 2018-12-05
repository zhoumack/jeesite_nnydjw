package com.thinkgem.jeesite.modules.sys.myutils;

import java.util.*;



import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 树状json转化
 * @author she
 *
 */
public class TreeBuilder {
    List<Node> nodes = new ArrayList<Node>();
    

    public List<Node> getNodes() {
		return nodes;
	}

	public void setNodes(List<Node> nodes) {
		this.nodes = nodes;
	}

	public List buildTree(List<Node> nodes) {

        TreeBuilder treeBuilder = new TreeBuilder(nodes);

        return treeBuilder.buildJSONTree();
    }

    public TreeBuilder() {
    }

    public TreeBuilder(List<Node> nodes) {
        super();
        this.nodes = nodes;
    }

    // 构建JSON树形结构
    public List buildJSONTree() {
        List<Node> nodeTree = buildTree();
        return nodeTree;
    }

    // 构建树形结构
    public List<Node> buildTree() {
        List<Node> treeNodes = new ArrayList<Node>();
        List<Node> rootNodes = getRootNodes();
        for (Node rootNode : rootNodes) {
            buildChildNodes(rootNode);
            treeNodes.add(rootNode);
        }
        return treeNodes;
    }

    // 递归子节点
    public void buildChildNodes(Node node) {
        List<Node> children = getChildNodes(node);
        if (!children.isEmpty()) {
            for (Node child : children) {
                buildChildNodes(child);
            }
            node.setChildren(children);
        }else{
        	List<Node> nodesUser=new ArrayList<Node>();
        	 for (Node child : nodes) {
             	if(child.getType().equals("2")&&node.getId().equals(child.getPid())){
             		nodesUser.add(child);
             	}
             }
        	 node.setChildren(nodesUser);
        }
       
    }

    // 获取父节点下所有的子节点
    public List<Node> getChildNodes(Node pnode) {
        List<Node> childNodes = new ArrayList<Node>();
        for (Node n : nodes) {
            if (pnode.getId().equals(n.getPid())&&pnode.getType().equals(n.getType())) {
            	n.setLayer(pnode.getLayer()+1);
                childNodes.add(n);
            }
        }
        return childNodes;
    }

    // 判断是否为根节点
    public boolean rootNode(Node node) {
        boolean isRootNode = true;
        for (Node n : nodes) {
            if (node.getPid().equals(n.getId())) {
                isRootNode = false;
                break;
            }
        }
        node.setLayer(1);
        return isRootNode;
    }

    // 获取集合中所有的根节点
    public List<Node> getRootNodes() {
        List<Node> rootNodes = new ArrayList<Node>();
        for (Node n : nodes) {
            if (rootNode(n)) {
                rootNodes.add(n);
            }
        }
        return rootNodes;
    }

}
