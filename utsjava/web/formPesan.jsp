<%@ page import="java.util.*" %>
<%
    List<Map<String, Object>> daftarFilm = (List<Map<String, Object>>) session.getAttribute("daftarFilm");

    if (daftarFilm == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Form Tiket Bioskop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Jost', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(120deg, #9b5de5, #f15bb5, #fee440);
            background-size: 300% 300%;
            animation: gradientBG 12s ease infinite;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .card-form {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(14px);
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 0 25px rgba(255, 255, 255, 0.1);
        }

        h2 {
            color: #fff;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        label {
            color: #fceaff;
            font-weight: 500;
        }

        .form-select, .form-control {
    background-color: rgba(255, 255, 255, 0.25); /* lebih terang */
    color: #fff;
    border: 1px solid rgba(255, 255, 255, 0.4);
}

.form-select option {
    background-color: #fff;       /* latar belakang dropdown */
    color: #000 !important;       /* teks hitam agar kontras */
}


        .form-control::placeholder {
            color: #e0d8ff;
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.25);
            color: #fff;
        }

        .btn-animate {
            background: linear-gradient(90deg, #ff6ec4, #7873f5);
            color: white;
            border: none;
            border-radius: 20px;
            padding: 12px 24px;
            width: 100%;
            font-weight: bold;
            transition: 0.4s ease;
            box-shadow: 0 0 10px rgba(255, 105, 180, 0.6);
        }

        .btn-animate:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(255, 105, 180, 0.9);
        }
        .form-check-inline input[type="radio"] {
    display: none;
}

.form-check-inline input[type="radio"]:checked + label {
    background-color: #ffcbf2;
    color: #5e548e;
    border-color: #ffb3c1;
    font-weight: bold;
}

.btn-outline-light {
    background-color: rgba(255, 255, 255, 0.4);
    border-color: transparent;
    color: #000;
    transition: all 0.3s ease;
}

.btn-outline-light:hover {
    background-color: #fff;
    color: #d63384;
}
    </style>
</head>
<body>
    <div class="card-form">
        <h2>Pesan Tiket</h2>
        <form action="struk.jsp" method="post">
            <div class="mb-3">
                <label for="nama">Nama Lengkap</label>
                <input type="text" class="form-control" id="nama" name="nama" placeholder="Masukkan nama kamu" required>
            </div>
            <div class="mb-3">
                <label for="film"> Pilih Film</label>
                <select class="form-select" name="film" id="film" required>
                    <option value="" disabled selected>-- Pilih Film --</option>
                    <% for (Map<String, Object> film : daftarFilm) { %>
                        <option value="<%= film.get("judul") %>">
                            <%= film.get("judul") %> - Rp <%= film.get("harga") %>
                        </option>
                    <% } %>
                </select>
            </div>
            <div class="mb-3">
                <label for="jumlah"> Jumlah Tiket</label>
                <input type="number" class="form-control" id="jumlah" name="jumlah" min="1" placeholder="Contoh: 2" required>
            </div>
            <div class="mb-3">
                <label class="form-label mt-4">Pilih Jam Tayang</label>
<div class="d-flex flex-wrap gap-2">
    <%
        int filmIndex = 0;
        String paramIndex = request.getParameter("filmIndex");
        if (paramIndex != null) {
            try {
                filmIndex = Integer.parseInt(paramIndex);
            } catch (NumberFormatException e) {
                filmIndex = 0;
            }
        }
        List<String> jamTayang = (List<String>) daftarFilm.get(filmIndex).get("jamTayang");
        for (String jam : jamTayang) {
    %>
        <div class="form-check form-check-inline jam-option">
            <input class="btn-check" type="radio" name="jam" id="jam_<%= jam %>" value="<%= jam %>" required>
            <label class="btn btn-outline-info rounded-pill px-4 py-2" for="jam_<%= jam %>"><%= jam %></label>
        </div>
    <% } %>
</div>
            <button type="submit" class="btn btn-animate mt-4">Pesan Sekarang</button>
        </form>
    </div>
</body>
</html>
