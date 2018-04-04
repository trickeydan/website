---
title: "Contact Me"
---

You can send me a message using the form below.

<form name="contact" method="POST" netlify>
  <p>
    <label>Name:</label></br>
    <input type="text" name="name">
  </p>
  <p>
    <label>Email:</label></br>
    <input type="email" name="email">
  </p>
  <p>
    <label>Message:</label><br/>
    <textarea name="message" cols="50" rows="10"></textarea>
  </p>
  <p><div data-netlify-recaptcha></div></p>
  <p>
    <button type=”submit”>Send!</button>
  </p>
</form>
