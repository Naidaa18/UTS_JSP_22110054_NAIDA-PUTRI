<%@ page import="java.util.*" %>

<%
    List<Map<String, Object>> daftarFilm = new ArrayList<>();

    String[] judulFilm = {
        "Resident Playbook", "Taxi Driver 2", "Dream High", "My Name", "Extraordinary You",
        "The Glory", "Twenty Five Twenty One", "Crash Landing On You", "Start-Up", "Vagabond",
        "Hospital Playlist", "Goblin", "It's Okay to Not Be Okay", "Business Proposal", "Sweet Home"
    };

    String[] genreFilm = {
        "Romance", "Action, Sci-Fi", "Musical", "Thriller", "Fantasy, School",
        "Drama, Revenge", "Slice of Life", "Romance, Drama", "Business, Romance", "Action, Mystery",
        "Medical, Drama", "Fantasy, Romance", "Psychological, Drama", "Romantic Comedy", "Horror, Action"
    };

    String[] durasiFilm = {
        "3h 2m", "2h 28m", "2h 10m", "2h", "2h 20m",
        "2h 15m", "2h 30m", "2h 40m", "2h 5m", "2h 25m",
        "2h 45m", "2h 50m", "2h 35m", "2h 15m", "2h 30m"
    };

    int[] hargaFilm = {
        50000, 45000, 40000, 48000, 47000,
        49000, 46000, 51000, 43000, 45000,
        52000, 55000, 53000, 44000, 47000
    };

    String[] lokasiFilm = {
        "Hartono Mall CGV", "Ambarukmo XXI", "Sleman City Hall", "Jogja City Mall", "Lippo Plaza Jogja",
        "Hartono Mall CGV", "Ambarukmo XXI", "Sleman City Hall", "Jogja City Mall", "Lippo Plaza Jogja",
        "Hartono Mall CGV", "Ambarukmo XXI", "Sleman City Hall", "Jogja City Mall", "Lippo Plaza Jogja"
    };

    String[] formatFilm = {
        "Starium 2D", "4DX2D", "Regular 2D", "IMAX 2D", "Regular 2D",
        "Starium 2D", "4DX2D", "Regular 2D", "IMAX 2D", "Regular 2D",
        "Starium 2D", "4DX2D", "Regular 2D", "IMAX 2D", "Regular 2D"
    };

    String[] posterFilm = {
        "assets/romance.jpg", "assets/action.jpg", "assets/dream.jpg", "assets/myname.jpg", "assets/extaordinary.jpg",
        "assets/glory.jpg", "assets/twenty.jpg", "assets/crash.jpg", "assets/star.jpg", "assets/vagabond.jpg",
        "assets/hospital.jpg", "assets/goblin.jpg", "assets/its.jpg", "assets/business.jpg", "assets/sweet.jpg"
    };

    String[][] jamTayangFilm = {
        {"10:00", "14:00", "18:00"}, {"11:00", "15:00", "19:00"}, {"09:00", "13:00", "17:00"},
        {"12:00", "16:00", "20:00"}, {"08:00", "12:00", "16:00"}, {"10:30", "14:30", "18:30"},
        {"11:15", "15:15", "19:15"}, {"09:45", "13:45", "17:45"}, {"12:30", "16:30", "20:30"},
        {"08:30", "12:30", "16:30"}, {"10:00", "14:00", "18:00"}, {"11:00", "15:00", "19:00"},
        {"09:00", "13:00", "17:00"}, {"12:00", "16:00", "20:00"}, {"08:00", "12:00", "16:00"}
    };

    String[] sinopsisFilm = {
        "Kisah perjuangan para dokter muda menjalani tahun pertama residensi di Rumah Sakit Yulje.",
        "Seorang supir taksi yang terlibat dalam kasus kejahatan yang rumit.",
        "Sekelompok siswa berjuang meraih impian mereka di dunia musik.",
        "Seorang wanita mencari identitas dan balas dendam atas kematian ayahnya.",
        "Gadis muda yang menemukan dirinya berbeda di dunia fantasi sekolah.",
        "Kisah balas dendam seorang wanita yang berjuang membalas luka masa lalu.",
        "Cerita kehidupan sehari-hari sekelompok remaja di kota kecil.",
        "Kisah cinta tak terduga antara dua orang dari dunia berbeda.",
        "Startup teknologi dan perjuangan para pendirinya untuk sukses.",
        "Seorang agen rahasia yang mengungkap konspirasi besar.",
        "Persahabatan dokter di sebuah rumah sakit penuh drama.",
        "Malaikat kematian yang mencari arti kehidupan di dunia manusia.",
        "Dua jiwa yang sembuh lewat cinta dan pengertian satu sama lain.",
        "Komedi romantis tentang kesalahpahaman dalam dunia bisnis.",
        "Keluarga yang berjuang melawan makhluk mengerikan di rumah mereka."
    };

    for (int i = 0; i < 15; i++) {
        Map<String, Object> film = new HashMap<>();
        film.put("judul", judulFilm[i]);
        film.put("genre", genreFilm[i]);
        film.put("durasi", durasiFilm[i]);
        film.put("harga", hargaFilm[i]);
        film.put("lokasi", lokasiFilm[i]);
        film.put("format", formatFilm[i]);
        film.put("poster", posterFilm[i]);
        film.put("jamTayang", Arrays.asList(jamTayangFilm[i]));
        film.put("sinopsis", sinopsisFilm[i]);
        daftarFilm.add(film);
    }

    session.setAttribute("daftarFilm", daftarFilm);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Daftar Film Tayang</title>
    <meta charset="UTF-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:wght@300;500;700&display=swap" rel="stylesheet" />

    <style>
        body {
            background-color: #fff0f5;
            font-family: 'Poppins', sans-serif;
        }

        h2 {
            font-family: 'Pacifico', cursive;
            color: #d63384;
            text-align: center;
            margin-bottom: 40px;
            font-size: 36px;
        }

        .card {
            border-radius: 20px;
            box-shadow: 0 4px 16px rgba(255, 153, 200, 0.25);
            transition: transform 0.3s;
            background: #ffffff;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-title {
            font-weight: bold;
            color: #b03060;
            font-size: 16px;
        }

        .badge {
            background-color: #ffc8dd;
            color: #6c2c71;
            margin: 2px;
            font-size: 12px;
        }

        .btn-primary {
            background-color: #ff99c8;
            border: none;
            font-size: 14px;
            padding: 6px 14px;
            border-radius: 10px;
        }

        .btn-primary:hover {
            background-color: #ff70a6;
        }

        .card-img-top {
            height: 220px;
            object-fit: cover;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }

        .card-body {
            padding: 1rem;
        }

        .film-info {
            font-size: 13px;
            color: #444;
            line-height: 1.4;
        }
        .judul-section {
            background: linear-gradient(135deg, #ffe0f0, #fff0f5);
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(255, 153, 200, 0.3);
            margin-bottom: 30px;
        }
        .judul-section h2 {
            color: #d63384;
            font-weight: 700;
            font-size: 28px;
            margin-bottom: 8px;
        }
        .subjudul {
    font-size: 14px;
    color: #b76e79;
    margin: 0;
    text-align: center; /* ini yang bikin tengah */
}

            /* Tooltip tanda seru */
    .sinopsis-tooltip {
        display: inline-block;
        color: #d63384;
        font-weight: bold;
        font-size: 18px;
        cursor: default;
        margin-left: 6px;
        border-bottom: 1px dotted #d63384;
        user-select: none;
    }
    .sinopsis-tooltip:hover {
        color: #ff70a6;
    }

    /* Panah di tombol */
    .panah {
        margin-left: 6px;
        font-weight: bold;
        font-size: 16px;
    }
</style>
    </head>
    <body> 
    <div class="container py-4"> <div class="judul-section"> <h2>Daftar Film Tayang</h2> <p class="subjudul">Pilih film favoritmu dan klik "Beli Tiket" untuk pesan tiketnya</p> </div>
          <div class="row row-cols-1 row-cols-md-3 g-4">
        <% for (Map<String, Object> film : daftarFilm) { %>
            <div class="col">
                <div class="card h-100">
                    <img src="<%= film.get("poster") %>" class="card-img-top" alt="Poster Film" />
                    <div class="card-body">
                        <h5 class="card-title"><%= film.get("judul") %></h5>

                        <div class="film-info mb-2">
                            <strong>Genre:</strong> <%= film.get("genre") %><br>
                            <strong>Durasi:</strong> <%= film.get("durasi") %><br>
                            <strong>Harga:</strong> Rp <%= film.get("harga") %><br>
                            <strong>Lokasi:</strong> <%= film.get("lokasi") %><br>
                            <strong>Format:</strong> <%= film.get("format") %>
                        </div>

                        <div class="mb-2">
                            <% 
                            List<String> jamTayang = (List<String>) film.get("jamTayang");
                            for (String jam : jamTayang) { 
                            %>
                                <span class="badge"><%= jam %></span>
                            <% } %>

                            <!-- Tanda seru dengan tooltip sinopsis -->
                            <span class="sinopsis-tooltip" title="<%= film.get("sinopsis") %>">!</span>
                        </div>

                        <a href="formPesan.jsp?filmIndex=<%= daftarFilm.indexOf(film) %>" class="btn btn-primary w-100">
                            Beli Tiket <span class="panah"></span>
                        </a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>
 </body>
</html>  