const express = require("express");
const router = express.Router();
const axios = require("axios");

// WhatsApp Template Messages based on Source_Category_Id
const messageTemplates = {
  1: `🏠 Techtify – Making Homes & Offices Smarter!
        Explore Automation, CCTV, Solar & Security Solutions. ⚡
        Thanks for reaching out! Our sales experts will assist you shortly. 💬

        🌐 www.techtify.co.in
        ⚡ Energised by Britco & Bridco`,

  2: `🔧 Techtify – Fast & Reliable Service!
        We handle Automation, CCTV, Solar, Smart Electronics & IoT Device Repairs with expert care. ⚡
        Thank you for reaching out! Our service team will contact you shortly. 💬

        🌐 www.techtify.co.in
        ⚡ Energised by Britco & Bridco`,

  3: `🚀 Kickstart Your Career with Techtify School!
        Upskill courses for freshers & aspiring technicians in Smart Technology, Automation, CCTV & Solar. ⚡
        Thanks for reaching out! Our team will guide you soon. 💬

        🌐 www.techtify.co.in
        ⚡ Energised by Britco & Bridco`,

  4: `🔐 Techtify – Powering Smart & Secure Living.
        Thank you for reaching out!
        Our experts will assist you shortly. 💬

        🌐 www.techtify.co.in
        ⚡ Energised by Britco & Bridco`,

  5: `🔧 Thank You for Choosing Techtify!
        We hope you loved our service. Help us get even better by sharing your experience! 🌟
        🌐 Leave Feedback on Google
        https://g.page/r/CS99oExaNNE6EBM/review`,
};

router.post("/send", async (req, res) => {
  const { whatsappNumber, Source_Category_Id } = req.body;

  console.log("Received Data:", req.body);

  if (!whatsappNumber || !Source_Category_Id) {
    return res.status(400).json({
      message: "Missing whatsappNumber or Source_Category_Id",
    });
  }

  // Pick message template based on category ID
  const message = messageTemplates[Source_Category_Id];
  if (!message) {
    return res.status(400).json({ message: "Invalid Source_Category_Id" });
  }

  try {
    const url =
      "https://live-server-115767.wati.io/api/v1/sendSessionMessage/" +
      encodeURIComponent("+91" + whatsappNumber);

    const data = {
      messageText: message,
      messageType: "TEXT",
    };

    const response = await axios.post(url, data, {
      headers: {
        accept: "*/*",
        Authorization:
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkZjI0OTYzOC00MzhkLTRlMmMtYWQ2Yi0xOGY2NWIwYTk0MTYiLCJ1bmlxdWVfbmFtZSI6ImFyanVuQG9uZXRlYW1zb2x1dGlvbnMuY28uaW4iLCJuYW1laWQiOiJhcmp1bkBvbmV0ZWFtc29sdXRpb25zLmNvLmluIiwiZW1haWwiOiJhcmp1bkBvbmV0ZWFtc29sdXRpb25zLmNvLmluIiwiYXV0aF90aW1lIjoiMDEvMzEvMjAyNCAwNzoxNzo0MyIsImRiX25hbWUiOiIxMTU3NjciLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBRE1JTklTVFJBVE9SIiwiZXhwIjoyNTM0MDIzMDA4MDAsImlzcyI6IkNsYXJlX0FJIiwiYXVkIjoiQ2xhcmVfQUkifQ.nqihj10ep-rq2ODhP9tuNbdyG8r8IpYrlM-0Q_36LeM",
        "Content-Type": "application/json",
      },
    });

    res.json({
      success: true,
      message: "WhatsApp message sent successfully",
      response: response.data,
    });
  } catch (error) {
    console.error("WhatsApp API Error:", error.response?.data || error.message);
    res.status(500).json({
      success: false,
      message: "Failed to send WhatsApp message",
      error: error.response?.data || error.message,
    });
  }
});

module.exports = router;
