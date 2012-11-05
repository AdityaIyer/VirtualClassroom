<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" type="text/css" href="/stylesheets/960.css" />
<link rel="stylesheet" type="text/css" href="/stylesheets/BasicStyle.css" />
<link rel="stylesheet" type="text/css" href="/stylesheets/error.css" />
<script type="text/javascript" src="/javascript/datetimepicker.js" ></script>


	<div class="container_9">
	<div class="grid_9"><h1>Create A Class</h1></div>
	
	<form:form action="/classCreate.do" method="post"  commandName="createClassFormBean">
        <form:errors path="*" >
        	<div class="error" >Please correct the form errors and resubmit the form.</div>
        </form:errors>
		<br />
		<ul class=table>

			<li>
				<div class="grid_3">
					<form:label path="classTitle">Class Title</form:label>
					<form:input path="classTitle" />
					<form:errors path="classTitle" cssClass="error" />
				</div>
				
						<div class="grid_3">
   					<form:label path="classDescription">Class Description</form:label>
   					<form:textarea path="classDescription" />
   					<form:errors path="classDescription" cssClass="error" />
   				</div>
   				
   			</li>  
   			
   			<li>
   				<div class="grid_3">
   					<form:label path="classCategory">Class Category</form:label>
   					<form:input path="classCategory" />
   					<form:errors path="classCategory" cssClass="error" />
   				</div>
   				<div class="grid_3">
   						<form:label path="classLevel">Class Level</form:label>
   					<ul>
   						<li>
   							<form:label path="classLevel">Beginner</form:label>
   							<form:radiobutton path="classLevel" value="beginner"/>
   						</li>
   						<li>
   							<form:label path="classLevel">Intermediate</form:label>
   							<form:radiobutton path="classLevel" value="intermediate"/>
   						</li>
   						<li>
   							<form:label path="classLevel">Advanced</form:label>
   							<form:radiobutton path="classLevel" value="advanced"/>
   						</li>
   					</ul>
   				</div>
   			</li>
   			
   			<li>
   				<div class="grid_3">
   					<form:label path="minStudents">Minimum Class Size:</form:label>
   					<form:input path="minStudents" />
   					<form:errors path="minStudents" cssClass="error" />
   				</div>
   				<div class="grid_3">
   					<form:label path="maxStudents">Maximum Class Size:</form:label>
   					<form:input path="maxStudents" />
   					<form:errors path="maxStudents" cssClass="error" />
   				</div>
   			</li>
   			<li>
   				<div class="grid_3">
   					<form:label path="classDate">Class Date</form:label>
   					<form:input readonly="true" path="classDate" /><a href="javascript:NewCal('classDate','mmddyyyy',true,12)"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
   					<form:errors path="classDate" cssClass="error" />
   				</div>
   				<div class="grid_3">
   					<form:label path="classStartTime">Class Start Time</form:label>
   					<form:input path="classStartTime" />
   					<form:errors path="classStartTime" cssClass="error" />
   				</div>
   				<div class="grid_3">
   					<form:label path="classEndTime">Class End Time</form:label>
   					<form:input path="classEndTime" />
   					<form:errors path="classEndTime" cssClass="error" />
   				</div>
   			</li>
   			<li>
				<div class="grid_3 prefix_3"><input type="submit" value="Create Class" /></div>			
			</li>
				
		</ul>
	</form:form>
</div>
