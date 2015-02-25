<#--
  - $Revision$
  - $Date$
  -
  - Copyright (C) Jive Software. All rights reserved.
  - This software is the proprietary information of Jive Software. Use is subject to license terms.
-->

<html>
<head>
    <title>Profile Settings</title>
    <content tag="pagetitle">Profile Settings</content>
    <content tag="pageID">usersgroups-profile</content>
    <content tag="pagehelp">
        <h3>Profile Settings</h3>
        <p>
            Profile fields are the basic building blocks of a users profile.
            Below are all the profile fields defined in the system. To create a new profile field, click
            "New Field" below.
        </p>
    </content>

    <script language="JavaScript">
        function toggleAll(field) {
            var fieldIDs = field.form.fieldIDs;
            if (fieldIDs != null) {
                if (field.checked) {
                    for (i = 0; i < fieldIDs.length; i++) {
                        fieldIDs[i].checked = true;
                    }
                } else {
                    for (i = 0; i < fieldIDs.length; i++) {
                        fieldIDs[i].checked = false;
                    }
                }
            }
        }
    </script>
</head>

<body>

<#if rebuildIndexNedeed && statics['com.jivesoftware.community.util.BasePermHelper'].isSystemAdmin()>
    <div class="jive-warn-box" id="jive-user-profile-rebuild-index-alert">
        <div>
            <span class="jive-icon-med jive-icon-warn"></span>
        Warning: Some options that control field searchability or visibility have changed, visit the <a href="<@s.url value='user-search-admin.jspa?selectedTab=tasks'/>">User Search</a> page and rebuild the index.
        </div>
    </div>
</#if>

<#if "true" == request.getParameter("success")?default('')  >

    <div class="jive-success">
    <table cellpadding="0" cellspacing="0" border="0">
    <tbody>
        <tr><td class="jive-icon"><img src="images/success-16x16.gif" width="16" height="16" border="0" alt="" /></td>
        <td class="jive-icon-label">
        Settings saved successfully.
        </td></tr>
    </tbody>
    </table>
    </div><br />
</#if>

<@s.action name="manage-profile-settings" executeResult="true" ignoreContextParams="true" />

<h3>Default Profile Fields</h3>

<div class="jive-table">
<table summary="Default Profile Fields" cellpadding="3" cellspacing="0" border="0" width="100%">
<thead>
    <tr>
        <th colspan="2">Name</th>
        <th>Type</th>
        <th class="center">Properties</th>
		<th class="center">Options</th>
    </tr>
</thead>
<tbody>
    <#if defaultFields.size() == 0>
        <tr>
            <td colspan="2" class="jive-empty">No default profile fields defined.</td>
        </tr>
    <#else>

        <#list defaultFields as field>
            <tr class="jive-<#if (field_index % 2 == 0)>odd<#else>even</#if>">
                <td width="1%">
                    <img src="<@s.url value='images/fieldtype-${field.type.name()?lower_case}-24x24.gif'/>" border="0"
                         title="Type: ${field.type.name()?lower_case}" alt="${field.type.name()?lower_case}" />
                </td>
                <td>
                    <b>${field.name?html}</b>
                    <#if field.description?exists>
                        <br/>
                        <span class="jive-description">
                        ${field.description?default('No description')?html}
                        </span>
                    </#if>
                </td>
                <td>
                    ${field.type.displayName?html}
                </td>
                <td class="center jive-description">
                    <a href="<@s.url value='editProfileField!input.jspa' fieldID='${field.ID?c}' />"
                        title="Click to edit this field...">Edit</a>
                </td>
                <td class="center jive-description">
                    <#if field.type.ID == 1 || field.type.ID == 7 || field.type.ID == 8>
                        <a href="<@s.url value='editProfileFieldOptions!input.jspa' fieldID='${field.ID?c}' />"
                        title="Click to edit field options...">Options</a>
                     <#else>
                        N/A
                     </#if>
                </td>
            </tr>
        </#list>

    </#if>
</tbody>
</table>
</div>

<br/>

<h3>Custom Profile Fields</h3>

<div class="jive-buttons">
<table summary="Buttons" cellpadding="0" cellspacing="0" border="0">
<tbody>
    <tr>
        <td class="jive-icon">
            <a href="profileFieldWizard!input.jspa"
             ><img src="<@s.url value='images/field-icon-16x16.gif'/>" width="16" height="16" border="0" alt="" /></a>
        </td>
        <td class="jive-icon-label">
            <a id="" href="profileFieldWizard!input.jspa"
             >New Field</a>
        </td>
    </tr>
</tbody>
</table>
</div>

<br/>

<form action="deleteProfileFields.jspa" id="profileFieldForm" method="post">
<@jive.token name="delete.profile.fields"/>

<div class="jive-table">
<table summary="Custom Profile Fields" cellpadding="3" cellspacing="0" border="0" width="100%">
<thead>
    <tr>
        <th colspan="2">Name</th>
        <th>Type</th>
        <th class="center">Properties</th>
        <th class="center">Options</th>
        <th class="center">Order</th>
        <th class="center">
            <input type="checkbox" name="" value="" onChange="toggleAll(this);"/>
        </th>
    </tr>
</thead>
<tbody>

    <#if customFields.size() == 0>

        <tr>
            <td colspan="7" class="jive-empty">No custom profile fields defined.</td>
        </tr>

    <#else>

        <#list customFields as field>

            <tr class="jive-<#if (field_index % 2 == 0)>odd<#else>even</#if>">
                <td width="1%">
                    <img src="<@s.url value='images/fieldtype-${field.type.name()?lower_case}-24x24.gif'/>" border="0"
                         title="Type: ${field.type.name()?lower_case}" alt="${field.type.name()?lower_case}" />
                </td>
                <td>
                    <b>${field.name?html}</b>
                    <#if field.description?exists>
                        <br/>
                        <span class="jive-description">
                        ${field.description?default('No description')?html}
                        </span>
                    </#if>
                </td>
                <td>
                    ${field.type.displayName?html}
                </td>
                <td class="center jive-description">
                    <a href="<@s.url value='editProfileField!input.jspa' fieldID='${field.ID?c}' />"
                        title="Click to edit this field...">Edit</a>
                </td>
                <td class="center jive-description">
                    <#if field.type.ID == 1 || field.type.ID == 7 || field.type.ID == 8>
                        <a href="<@s.url value='editProfileFieldOptions!input.jspa' fieldID='${field.ID?c}' />"
                        title="Click to edit field options...">Options</a>
                     <#else>
                        N/A
                     </#if>
                </td>
                <td class="center">
                    <center>
                    <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                        <#if (field.index > minCustomIndex)>
                            <a href="<@s.url value='moveProfileFieldUp.jspa' fieldID='${field.ID?c}' />">
                            <img src="<@s.url value='images/arrow-up-blue-16x16.gif'/>" width="16" height="16" alt="Move Up." border="0"/></a>
                        <#else>
                            <img src="<@s.url value='images/blank.gif'/>" width="13" height="9" border="0" vspace="2" hspace="2" alt="" />
                        </#if>
                        </td>
                        <td>
                        <#if (field.index < maxCustomIndex)>
                            <a href="<@s.url value='moveProfileFieldDown.jspa' fieldID='${field.ID?c}' />">
                            <img src="<@s.url value='images/arrow-down-blue-16x16.gif'/>" width="16" height="16" alt="Move Down." border="0"/></a>
                        <#else>
                            <img src="<@s.url value='images/blank.gif'/>" width="13" height="9" border="0" vspace="2" hspace="2" alt="" />
                        </#if>
                        </td>
                    </tr>
                    </table>
                    </center>
                </td>
                <td class="center">
                    <input type="checkbox" id="fieldIDs" name="fieldIDs" value="${field.ID?c}" />
                </td>
            </tr>

        </#list>

    </#if>

</tbody>
<tfoot>
    <tr>
        <td colspan="7" align="right">
            <input type="submit" name="" value="Delete" onclick="javascript: return confirm('Deleting a profile field will remove all user data associated with that field.\n Are you sure you want to continue?');"/>
        </td>
    </tr>
</tfoot>
</table>
</div>

</form>

</body>
</html>