<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title') - Terramoi</title>
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>
<body>

<header>
    <h1>Terramoi</h1>

    <nav>
        <a href="{{ route('welcome') }}">Accueil</a>
    </nav>
</header>

<main>
    @yield('content')
</main>

<footer>
    <p>© Terramoi</p>
</footer>

</body>
</html>
