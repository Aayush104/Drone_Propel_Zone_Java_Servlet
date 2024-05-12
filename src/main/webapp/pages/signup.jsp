<%@page import="Util.DroneUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/signup.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
 <main>
        <div class="box">
            <div class="inner-box">
                <form action="${pageContext.request.contextPath}/RegisterServlet" autocomplete="off" class="sign-up-form" method="post">
                    <div class="heading-signup">
                        <h2>Get Started</h2>
                    </div>

                    <div class="actual-form">
                         <div class="input-wrap">
                                <input type="text"  name="userName" class="input-field" autocomplete="off"
                                    required />
                                <label>Username</label>
                            </div>

                            <div class="input-wrap">
                                <input type="email" class="input-field" name="email" autocomplete="off" required />
                                <label>Email</label>
                            </div>

                            <div class="input-wrap">
                                <input type="text"  class="input-field" name="address" autocomplete="off"
                                    required />
                                <label>Address</label>
                            </div>

                            <div class="input-wrap">
                                <input type="tel"  class="input-field" name="phoneNumber" autocomplete="off"
                                    />
                                <label>Phone</label>
                            </div>


                            <div class="input-wrap">
                                <input type="password"  class="input-field" name="password"
                                    autocomplete="off" required />
                                <label>Password</label>
                            </div>
                            <div class="input-wrap">
                                <input type="password"  class="input-field" name="confirmPassword"
                                    autocomplete="off" required />
                                <label>Confirm Password</label>
                            </div>

                        <input type="submit" value="Sign Up" class="sign-btn" />

                        <div class="text">
                            <h6>Already have an account?</h6>
                            <a href="${pageContext.request.contextPath}/pages/login.jsp">Sign in</a>
                        </div>
                    </div>
                </form>

                <div class="carousel">
                    <div class="images-wrapper">
                        <img src="${pageContext.request.contextPath}/images/droneimg3.png" class="image img-1 show" alt="" />
                        <img src="${pageContext.request.contextPath}/images/drone5.png" class="image img-2" alt="" />
                        <img src="${pageContext.request.contextPath}/images/droneimg.png" class="image img-3" alt="" />
                    </div>

                    <div class="text-slider">
                        <div class="text-wrap">
                            <div class="text-group">
                                <h2>Elevate Your Experience</h2>
                                <h2>Reach New Heights!</h2>
                                <h2>Explore Our Drones!</h2>
                            </div>
                        </div>

                        <div class="bullets">
                            <span class="active" data-value="1"></span>
                            <span data-value="2"></span>
                            <span data-value="3"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

<%-- Displaying success or error messages --%>
<% if (request.getAttribute(DroneUtils.SUCCESS_MESSAGE) != null) { %>
    <p style="color: green;"><%= request.getAttribute(DroneUtils.SUCCESS_MESSAGE) %></p>
<% } else if (request.getAttribute(DroneUtils.ERROR_MESSAGE) != null) { %>
    <p style="color: red;"><%= request.getAttribute(DroneUtils.ERROR_MESSAGE) %></p>
<% } %>


<script>
const inputs = document.querySelectorAll(".input-field");

const main = document.querySelector("main");
const bullets = document.querySelectorAll(".bullets span");
const images = document.querySelectorAll(".image");

inputs.forEach((inp) => {
  inp.addEventListener("focus", () => {
    inp.classList.add("active");
  });
  inp.addEventListener("blur", () => {
    if (inp.value != "") return;
    inp.classList.remove("active");
  });
});

function moveSlider() {
  let index = this.dataset.value;

  let currentImage = document.querySelector(`.img-${index}`);
  images.forEach((img) => img.classList.remove("show"));
  currentImage.classList.add("show");

  const textSlider = document.querySelector(".text-group");
  textSlider.style.transform = `translateY(${-(index - 1) * 2.2}rem)`;

  bullets.forEach((bull) => bull.classList.remove("active"));
  this.classList.add("active");
}

bullets.forEach((bullet) => {
  bullet.addEventListener("click", moveSlider);
});
</script>

</body>
</html>