<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String nama = request.getParameter("nama");
    String judul = request.getParameter("film"); // disesuaikan dari formPesan.jsp
    String jamTayang = request.getParameter("jam");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));

    List<Map<String, Object>> daftarFilm = (List<Map<String, Object>>) session.getAttribute("daftarFilm");

    int harga = 0;
    for (Map<String, Object> film : daftarFilm) {
        if (film.get("judul").equals(judul)) {
            harga = (int) film.get("harga");
            break;
        }
    }

    int total = harga * jumlah;
    String kodeBooking = String.valueOf((int)(Math.random() * 90000) + 10000);
    String seat = "A" + ((int)(Math.random() * 10) + 1);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Struk Tiket - <%= judul %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:wght@300;500;700&display=swap" rel="stylesheet" />
    <style>
        body {
            background-color: #fff0f5;
            font-family: 'Poppins', sans-serif;
        }
        .ticket {
            max-width: 600px;
            background: #ffe6f0;
            color: #4b004f;
            padding: 30px;
            border-radius: 25px;
            margin: 40px auto;
            box-shadow: 0 6px 18px rgba(255, 153, 200, 0.3);
        }
        h3 {
            font-family: 'Pacifico', cursive;
            text-align: center;
            color: #d63384;
            margin-bottom: 30px;
        }
        p {
            font-size: 16px;
        }
        .ticket-bottom {
            background: #ff99c8;
            color: #4b004f;
            padding: 20px;
            border-radius: 15px;
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        .booking-code {
            font-weight: bold;
            font-size: 1.4em;
        }
        .seat {
            font-size: 1.2em;
        }
        .btn-kembali {
            display: block;
            width: 100%;
            max-width: 600px;
            margin: 20px auto 0;
            background-color: #ff99c8;
            border: none;
            border-radius: 12px;
            font-weight: bold;
        }
        .btn-kembali:hover {
            background-color: #ff70a6;
        }
    </style>
</head>
<body>
    
    <div class="ticket">
        
        <h3>🎟️ Struk Pemesanan Tiket</h3>
        <p><strong>Nama Pemesan:</strong> <%= nama %></p>
        <p><strong>Judul Film:</strong> <%= judul %></p>
        <p><strong>Jam Tayang:</strong> <%= jamTayang %></p>
        <p><strong>Jumlah Tiket:</strong> <%= jumlah %></p>
        <p><strong>Harga per Tiket:</strong> Rp <%= harga %></p>
        <hr>
        <p><strong>Total Bayar:</strong> Rp <%= total %></p>

        <div class="ticket-bottom">
            <div class="booking-code">Kode Booking:<br> <%= kodeBooking %></div>
            <div class="seat">Seat:<br> <%= seat %></div>
        </div>
    </div>
        

    <a href="index.jsp" class="btn btn-primary btn-kembali">Kembali ke Daftar Film</a>
</body>
</html>
