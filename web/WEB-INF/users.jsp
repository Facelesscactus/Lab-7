<%-- 
    Document   : users
    Created on : 1-Nov-2022, 7:20:31 PM
    Author     : jacke
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--
Submitting the right link this time so I actually get a grade 

-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <title>Users</title>
    </head>
    <body>
        <!--<div class="p-3 mb-2 bg-primary text-white">.bg-primary</div>-->
        <h1 class="text-center">User management System</h1>     
        <div class="container">
            
            <form action="user" method="POST">
                <input type="hidden" name="action" value="createUser">
                <h2>Add User</h2>
                <table>
                    <tr><td><label for="inEmail">Email: </label></td><td><input type="email" name="inEmail" placeholder="Enter Email"></td></tr>
                    <tr><td><label for="inFirstName">First Name: </label></td><td><input type="text" name="inFirstName" placeholder="Enter Firstname"></td></tr>
                    <tr><td><label for="inLastName">Last Name: </label></td><td><input type="text" name="inLastName" placeholder="Enter LastName"></td></tr>
                    <tr><td><label for="inPassword">Password: </label></td><td><input type="password" name="inPassword" placeholder="Enter Password"></td></tr>
                    <tr><td><label for="SelectRole"></label></td>
                        <td>
                            <select name="SelectRole">
                                <option>Select Role</option>
                                <c:forEach var="role" items="${roles}">
                                    <option>${role.roleName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </table>
                
                <button type="submit" class="btn btn-dark">Submit</button>
            </form>
            
            <br>
            <br>
            
            <div class="row">
                <div class="col">
                     <table class="table">
                        <thread>
                            <tr>
                                <th>E-mail</th>
                                <th>First name</th>
                                <th>Last name</th>
                                <th>Active</th>
                                <th>Actions</th>
                            </tr>
                        </thread>
                        <tbody>
                            <c:forEach var="user" items="${users}"> 
                                    <tr>
                                            <td>${user.email}</td>
                                            <td>${user.firstName}</td>
                                            <td>${user.lastName}</td>
                                            <td>${user.active ? "Y" : "N"}</td>
                                            <td>
                                                <a href="user?action=edit&user=${user.email}">Edit</a>
                                                <a href="user?action=delete&user=${user.email}">Delete</a>
                                            </td>
                                    </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            
            
            <form action="user" method="POST">
                <input type="hidden" name="action" value="submitEdit">
                <h2>Edit User</h2>
                <table>
                    <tr><td><label for="ViewEmail">Email: </label></td><td><input placeholder="Enter Email" type="text" name="ViewEmail" value="<%= request.getAttribute("emailToEdit")%>" readonly="true"></td></tr>
                    <tr><td><label for="EditFirstName">First Name: </label></td><td><input placeholder="Enter FirstName" type="text" name="EditFirstName" value="<%= request.getAttribute("editFirstName") %>"></td></tr>
                    <tr><td><label for="EditLastName">Last Name: </label></td><td><input placeholder="Enter LastName" type="text" name="EditLastName" value="<%= request.getAttribute("editLastName") %>"></td></tr>
                    <tr><td><label for="EditRole"></label></td>
                        <td>
                                <select name="EditRole">
                                    <option>Select Role</option>
                                    <c:forEach var="role" items="${roles}">
                                    <option>${role.roleName}</option>
                                    </c:forEach>
                                </select>
                            
                        </td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-dark">Submit</button>
            </form>

            
        </div> 
    </body>
</html>

