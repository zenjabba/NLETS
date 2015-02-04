package com.wth.nlets.template;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.jivesoftware.base.User;
import com.jivesoftware.base.aaa.AuthenticationProvider;
import com.jivesoftware.community.Community;
import com.jivesoftware.community.CommunityManager;
import com.jivesoftware.community.JiveConstants;
import com.jivesoftware.community.NotFoundException;
import com.jivesoftware.community.aaa.ImmutableUser;
import com.jivesoftware.community.places.action.PlaceOverviewAction;
import com.jivesoftware.community.web.soy.plugins.PluginTemplateDefinition;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.wth.nlets.v3.service.ContainerStreamConfigProvider;

public class SubspaceFollowTemplateDefinition implements PluginTemplateDefinition
{
	private static final Logger log = LogManager.getLogger(SubspaceFollowTemplateDefinition.class);

	private CommunityManager communityManager;
	private AuthenticationProvider authenticationProvider;
	private ContainerStreamConfigProvider containerStreamConfigProvider;
	
     /** 
     * The name of the template to in the head of the page. 
     * <p/> 
     * NOTE: this template should include any meta information or CSS to be included in the page. 
     * 
     * @return a fully qualified template name, or null if no template should be rendered in the head. 
     */  
    @Override  
    public String getHeadTemplateName() {  
        return "wth.nlets.subspacefollow";  
    }  
  
     /** 
     * The name of the template to in the body of the page. 
     * <p/> 
     * NOTE: this template should include any javascript to be included on the page.  The script should be included 
     * using the {jive.shared.soy.resourceInlineJs} template mechanism and MUST use the "plugins" id to be included 
     * properly. 
     * 
     * @return a fully qualified template name, or null if no template should be rendered in the body. 
     */  
    @Override  
    public String getBodyTemplateName() {  
        return null;  
    }  
  
     /** 
     * The model to pass to the head and body template at render time. 
     * 
     * @param ai          the current ActionInvocation. 
     * @param actionModel The model of the currently executing action.  If the action is not {@link SoyModelDriven} then 
     *                    this will be a reference to the action itself. 
     * @return an object that will be used to render the template(s). 
     */  
  
    @Override  
    public Object getModel(ActionInvocation ai, Object actionModel) 
    {  
        HashMap<String,Object> hashMap = new HashMap<String, Object>(); 

        //load the present community
        String displayName = getDisplayName(ai);
        long communityID = communityManager.findCommunityIDByDisplayName(displayName);
        try{
	        Community community = this.communityManager.getCommunity(communityID);
	        User user = this.getUser();
	        hashMap.put("userID", user.getID());
	        hashMap.put("containerID", communityID);
	        hashMap.put("containerType", JiveConstants.COMMUNITY);
	        
	        //load the user's streams
	        List<ContainerStreamConfig> streamList = containerStreamConfigProvider.getContainerStreamConfiguration(user, community);
	        hashMap.put("streamList", streamList);
        } catch (NotFoundException e) {
        	log.error(String.format("Unable to load community %d", communityID),e);
        }
        
        //store whether or not the user is following subspaces
        
        return hashMap;  
    }

    private String getDisplayName(ActionInvocation invocation) {
    	HttpServletRequest request = ServletActionContext.getRequest();
    	//request = (HttpServletRequest) context.get(ServletRequest.HTTP_REQUEST);
    	
    	String uri = request.getRequestURI();
    	String displayName = uri.substring(uri.indexOf("community/") + 10);

    	return "/" + displayName;
    }
    
	@Override
	public boolean supports(Action action) {
		return isInterested(action);
	}

	private boolean isInterested(Action action) {
		boolean result = false;
		
		if(action instanceof PlaceOverviewAction) {
			result = ((PlaceOverviewAction) action).getRequest().getRequestURI().startsWith("/community/");
			//result = true;
		}
		
		return result;
	}

    private User getUser() {
    	User user = null;
        try {
            User ju = authenticationProvider.getJiveUser();
            if (ju != null) {
                user = new ImmutableUser(authenticationProvider.getJiveUser());
            }
        }
        catch (Exception ex) {
            log.warn("Unable to retrieve jive user from authentication context.", ex);
        }
        return user;
    }

	public void setAuthenticationProvider(AuthenticationProvider authenticationProvider) {
		this.authenticationProvider = authenticationProvider;
	}	
	
	public void setCommunityManager(CommunityManager communityManager) {
		this.communityManager = communityManager;
	}

	public void setContainerStreamConfigProvider(
			ContainerStreamConfigProvider containerStreamConfigProvider) {
		this.containerStreamConfigProvider = containerStreamConfigProvider;
	}
}

