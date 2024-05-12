<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.ProductModel"%>
<%
request.getSession(false);
if (session.getAttribute("admin_mail") == null && session.getAttribute("user_mail") != null) {
	response.sendRedirect(request.getContextPath() + "/manageDisplayServlet");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Product Management</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/stylesheet/manageProducts.css">
</head>
<body>
	<nav>
		<div class="logo">
			<img src="${pageContext.request.contextPath}/images/logo.png" alt="">
		</div>
		<div class="nav-items">
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/pages/dashboard.jsp">Dashboard</a></li>
				<li><a
					href="${pageContext.request.contextPath}/pages/addProduct.jsp">Add
						Product</a></li>
				<li><a
					href="${pageContext.request.contextPath}/AdminProductsServlet">View
						Products</a></li>
				<li><a
					href="${pageContext.request.contextPath}/AdminOrderServlet">View
						Orders</a></li>
			</ul>
		</div>

		<form action="${pageContext.request.contextPath}/UserLogout"
			method="post">
			<button type="submit"
				style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer;">
				LogOut</button>
		</form>
	</nav>

	<div class="container">
		<div class="content">
			<h1>Product Management</h1>
			<table>
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Name</th>
						<th>Description</th>
						<th>Price</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<ProductModel> products = (List<ProductModel>) request.getAttribute("products");
					if (products != null && !products.isEmpty()) {
						for (ProductModel product : products) {
					%>
					<tr>
						<td><%=product.getProductId()%></td>
						<td><%=product.getProductName()%></td>
						<td><%=product.getProductDescription()%></td>
						<td>$<%=product.getProductPrice()%></td>
						<td>
						
						<form action="${pageContext.request.contextPath}/FetchProductIdServlet" method="post">
    						<input type="hidden" name="productId" value="<%=product.getProductId()%>">
   							<button type="submit" class="edit_btn">Edit</button>

							</form> <!-- Form for deletion -->
							<form method="post"
								action="${pageContext.request.contextPath}/ManageProductServlet">
								<input type="hidden" name="deleteId"
									value="<%=product.getProductId()%>">
								<button type="submit">Delete</button>
							</form>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="5">No products found.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>



	<footer>
		<div class="footer-left">
			<img src="<%=request.getContextPath()%>/images/whitelogo.png"
				alt="Logo">
			<p>Reach new heights!</p>
		</div>
		<div class="footer-right">
			<ul>
				<li><a href="<%=request.getContextPath()%>/home">Home</a></li>
				<li><a href="<%=request.getContextPath()%>/contact">Contact</a></li>
				<li><a href="<%=request.getContextPath()%>/collections">Collections</a></li>
				<li><a href="<%=request.getContextPath()%>/about">About us</a></li>
			</ul>
		</div>
		<div class="icons">
			<i class="fa-brands fa-facebook"></i> <i
				class="fa-brands fa-instagram"></i> <i class="fa-brands fa-skype"></i>
			<i class="fa-brands fa-twitter"></i>
		</div>
	</footer>
</body>
</html>
