class HotelsController < ApplicationController
  def index
    @hotels = hotel_data
    @destinations = @hotels.map { |h| h[:destination] }.uniq.sort
    @price_ranges = ['Económico', 'Moderado', 'Lujo']
    @star_options = [1, 2, 3, 4, 5]
  end

  def show
    @hotels = hotel_data
    @hotel = @hotels.find { |h| h[:slug] == params[:slug] } || @hotels.first
    @related_hotels = @hotels.reject { |h| h[:slug] == @hotel[:slug] }.first(3)
  end

  private

  def hotel_data
    [
      {
        slug: 'park-hyatt-kyoto',
        name: 'Park Hyatt Kyoto',
        destination: 'Kioto',
        country: 'Japón',
        stars: 5,
        rating: 4.9,
        reviews_count: 328,
        price: 650,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=1000&q=80',
          'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80',
          'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800&q=80',
          'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&q=80'
        ],
        amenities: ['Spa & Bienestar', 'Gimnasio 24/7', 'Restaurante Michelin', 'Concierge 24h', 'WiFi Ultra Rápido', 'Piscina Climatizada', 'Servicio a la Habitación'],
        tag: 'Lujo',
        address: '360 Kodaiji Masumi-cho, Higashiyama-ku, Kioto, Japón',
        description: 'Ubicado en la ladera del distrito histórico de Higashiyama, Park Hyatt Kyoto ofrece una experiencia de hospitalidad incomparable combinando el legado cultural de Kioto con el diseño atemporal y contemporáneo.',
        meta_description: 'Reserva tu estancia en Park Hyatt Kyoto. Hotel de 5 estrellas de ultra lujo en Kioto, Japón con spa, cocina gourmet y vistas panorámicas a la pagoda Yasaka.'
      },
      {
        slug: 'the-screen-hotel',
        name: 'The Screen Hotel',
        destination: 'Kioto',
        country: 'Japón',
        stars: 4,
        rating: 4.6,
        reviews_count: 142,
        price: 180,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=1000&q=80',
          'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&q=80',
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80'
        ],
        amenities: ['Restaurante Gourmet', 'Bar Lounge', 'WiFi de Alta Velocidad', 'Desayuno Incluido', 'Diseño Exclusivo'],
        tag: 'Boutique',
        address: '640-1 Shimomaruyacho, Nakagyo Ward, Kioto, Japón',
        description: 'Cada una de las 13 habitaciones boutique de The Screen fue concebida por un diseñador internacional distinto, ofreciendo una estancia única llena de arte y comodidad.',
        meta_description: 'Descubre The Screen Hotel en Kioto. Un concepto boutique exclusivo de 13 habitaciones personalizadas por diseñadores globales.'
      },
      {
        slug: 'nayara-springs',
        name: 'Nayara Springs',
        destination: 'La Fortuna',
        country: 'Costa Rica',
        stars: 5,
        rating: 4.9,
        reviews_count: 512,
        price: 450,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=1000&q=80',
          'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80',
          'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80'
        ],
        amenities: ['Aguas Termales Privadas', 'Spa de Selva', 'Piscina Infinity', 'Restaurante Fusión', 'Tours Ecoturísticos'],
        tag: 'Lujo',
        address: 'Parque Nacional Volcán Arenal, La Fortuna, Costa Rica',
        description: 'Un santuario exclusivo para adultos inmerso en la densa selva tropical de Costa Rica, con villas privadas alimentadas por aguas termales naturales del Volcán Arenal.',
        meta_description: 'Reserva Nayara Springs en Costa Rica. Resort de lujo con aguas termales naturales en medio de la selva tropical del Volcán Arenal.'
      },
      {
        slug: 'hotel-lomas-del-volcan',
        name: 'Hotel Lomas del Volcán',
        destination: 'La Fortuna',
        country: 'Costa Rica',
        stars: 3,
        rating: 4.5,
        reviews_count: 215,
        price: 90,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=1000&q=80',
          'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&q=80'
        ],
        amenities: ['Piscina al Aire Libre', 'WiFi Gratis', 'Desayuno Buffet', 'Senderos Privados', 'Estacionamiento'],
        tag: 'Económico',
        address: '4 km al oeste de la Iglesia Católica, La Fortuna, Costa Rica',
        description: 'Cabañas de madera cálidas rodeadas de naturaleza virgen y vistas ininterrumpidas a la imponente cima del Volcán Arenal.',
        meta_description: 'Disfruta de Hotel Lomas del Volcán en Costa Rica. Cabañas rústicas con piscina y vista directa al Volcán Arenal a precio accesible.'
      },
      {
        slug: 'le-sirenuse',
        name: 'Le Sirenuse',
        destination: 'Positano',
        country: 'Italia',
        stars: 5,
        rating: 4.9,
        reviews_count: 640,
        price: 800,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=1000&q=80',
          'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&q=80',
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80'
        ],
        amenities: ['Restaurante La Sponda', 'Bar Franco\'s', 'Spa con Sauna AROMAT', 'Piscina en Acantilado', 'Yate Privado'],
        tag: 'Lujo',
        address: 'Via Cristóforo Colombo 30, Positano, Italia',
        description: 'Un legendario palacio familiar transformado en un hotel de lujo atemporal, flotando sobre las acantilados coloridos de la mítica Costa Amalfitana.',
        meta_description: 'Reserva Le Sirenuse en Positano, Italia. El icónico hotel de lujo en la Costa Amalfitana con estrella Michelin y vistas idílicas al Mediterráneo.'
      },
      {
        slug: 'hotel-palazzo-murat',
        name: 'Hotel Palazzo Murat',
        destination: 'Positano',
        country: 'Italia',
        stars: 4,
        rating: 4.7,
        reviews_count: 189,
        price: 250,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=1000&q=80',
          'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80'
        ],
        amenities: ['Jardín Botánico Botánico', 'Piscina al Aire Libre', 'Restaurante Al Palazzo', 'Desayuno bajo Limoneros'],
        tag: 'Boutique',
        address: 'Via Dei Mulini 23, Positano, Italia',
        description: 'Antiguo palacio del siglo XVIII que perteneció a Gioacchino Murat, rodeado por uno de los jardines de limoneros más hermosos de Positano.',
        meta_description: 'Descubre Hotel Palazzo Murat en Positano. Un elegante palacio histórico del siglo XVIII con jardines frondosos y arquitectura tradicional.'
      },
      {
        slug: 'mont-cervin-palace',
        name: 'Mont Cervin Palace',
        destination: 'Zermatt',
        country: 'Suiza',
        stars: 5,
        rating: 4.9,
        reviews_count: 430,
        price: 700,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1602002418082-a4443e081dd1?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1602002418082-a4443e081dd1?w=1000&q=80',
          'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800&q=80'
        ],
        amenities: ['Spa Alpin', 'Acceso a Pistas de Esquí', 'Carruaje de Caballos Privado', 'Restaurante de Montaña', 'Cava de Vinos'],
        tag: 'Lujo',
        address: 'Bahnhofstrasse 31, Zermatt, Suiza',
        description: 'La tradición de hospitalidad alpina más refinada desde 1852, ofreciendo vistas de postal directamente a la majestuosa montaña del Matterhorn.',
        meta_description: 'Reserva Mont Cervin Palace en Zermatt, Suiza. Resort alpino de 5 estrellas con spa de lujo y vistas espectaculares al Matterhorn.'
      },
      {
        slug: 'ritz-paris',
        name: 'Ritz Paris',
        destination: 'París',
        country: 'Francia',
        stars: 5,
        rating: 4.8,
        reviews_count: 820,
        price: 1200,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=1000&q=80',
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80'
        ],
        amenities: ['Chanel Spa', 'Escuela de Cocina Ritz Escoffier', 'Bar Hemingway', 'Jardín Grande', 'Mayordomo Personal'],
        tag: 'Lujo',
        address: '15 Place Vendôme, 75001 París, Francia',
        description: 'Símbolo absoluto del art de vivre francés en la icónica Place Vendôme. Un lugar histórico visitado por reyes, artistas y leyendas mundiales.',
        meta_description: 'Vive el mito del Ritz Paris. El hotel de lujo más famoso de París en la Place Vendôme con gastronomía Michelin y Chanel Spa.'
      },
      {
        slug: 'hotel-des-arts-montmartre',
        name: 'Hôtel des Arts Montmartre',
        destination: 'París',
        country: 'Francia',
        stars: 3,
        rating: 4.4,
        reviews_count: 175,
        price: 120,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1455587734955-081b22074882?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1455587734955-081b22074882?w=1000&q=80',
          'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800&q=80'
        ],
        amenities: ['Hammam y Gimnasio', 'Desayuno Francés', 'WiFi Ultrarrápido', 'Ascensor Histórico'],
        tag: 'Económico',
        address: '5 Rue Tholozé, 75018 París, Francia',
        description: 'Encantador hotel familiar ubicado en una calle adoquinada y tranquila del mítico barrio de Montmartre, a pasos del Sacré-Cœur.',
        meta_description: 'Alójate en Hôtel des Arts Montmartre en París. Hotel económico y acogedor en el barrio más romántico de la capital francesa.'
      },
      {
        slug: 'aman-tokyo',
        name: 'Aman Tokyo',
        destination: 'Tokio',
        country: 'Japón',
        stars: 5,
        rating: 4.9,
        reviews_count: 490,
        price: 900,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1601918774946-25832a4be0d6?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1601918774946-25832a4be0d6?w=1000&q=80',
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80'
        ],
        amenities: ['Aman Spa 2500m²', 'Piscina de 30 metros', 'Restaurante Arva', 'Cigar Lounge', 'Vistas al Monte Fuji'],
        tag: 'Lujo',
        address: 'The Otemachi Tower, 1-5-6 Otemachi, Chiyoda-ku, Tokio, Japón',
        description: 'Un santuario zen urbano suspendido en los pisos superiores de la Torre Otemachi, uniendo el minimalismo tradicional japonés con arquitectura de vanguardia.',
        meta_description: 'Reserva Aman Tokyo. El santuario de lujo zen en las alturas de Tokio con vistas épicas a los rascacielos y al Monte Fuji.'
      },
      {
        slug: 'hotel-gracery-shinjuku',
        name: 'Hotel Gracery Shinjuku',
        destination: 'Tokio',
        country: 'Japón',
        stars: 3,
        rating: 4.3,
        reviews_count: 890,
        price: 110,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=1000&q=80',
          'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800&q=80'
        ],
        amenities: ['Terraza Godzilla Head', '7 Restaurantes', 'WiFi Gratis', 'Check-in Automatizado'],
        tag: 'Económico',
        address: '1-19-1 Kabukicho, Shinjuku-ku, Tokio, Japón',
        description: 'Famoso hotel temático ubicado en el corazón del animado distrito de Kabukicho en Shinjuku, conocido por la cabeza gigante de Godzilla en su terraza.',
        meta_description: 'Hotel Gracery Shinjuku en Tokio. Alójate junto a la famosa cabeza de Godzilla en la mejor ubicación céntrica de Kabukicho.'
      },
      {
        slug: 'athenee-palm-beach',
        name: 'Athénée Palm Beach',
        destination: 'Dubái',
        country: 'EAU',
        stars: 5,
        rating: 4.7,
        reviews_count: 310,
        price: 550,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=1000&q=80',
          'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&q=80'
        ],
        amenities: ['Playa Privada 500m', 'Waterpark Exclusivo', '6 Restaurantes', 'Helipuerto', 'Deportes Acuáticos'],
        tag: 'Lujo',
        address: 'Crescent Road, Palm Jumeirah, Dubái, EAU',
        description: 'Espectacular resort de estilo tropical y contemporáneo situado en el anillo exterior de la icónica isla artificial Palm Jumeirah.',
        meta_description: 'Reserva Athénée Palm Beach en Dubái. Resort de 5 estrellas con playa privada y vistas espectaculares en Palm Jumeirah.'
      },
      {
        slug: 'iberostar-selection',
        name: 'Iberostar Selection',
        destination: 'Cancún',
        country: 'México',
        stars: 4,
        rating: 4.5,
        reviews_count: 940,
        price: 200,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=1000&q=80',
          'https://images.unsplash.com/photo-1506953823976-52e1fdc0149a?w=800&q=80'
        ],
        amenities: ['Todo Incluido Gourmet', 'Campo de Golf 18 hoyos', 'Parque Acuático Infantil', 'Spa Sensations'],
        tag: 'Familiar',
        address: 'Bulevar Kukulcán Km 17, Zona Hotelera, Cancún, México',
        description: 'Resort familiar 5 estrellas todo incluido frente a las turquesas aguas del Caribe mexicano, con campo de golf y múltiples piscinas.',
        meta_description: 'Iberostar Selection Cancún. El mejor resort Todo Incluido frente al Mar Caribe para familias y parejas.'
      },
      {
        slug: 'banyan-tree-bangkok',
        name: 'Banyan Tree Bangkok',
        destination: 'Bangkok',
        country: 'Tailandia',
        stars: 5,
        rating: 4.7,
        reviews_count: 670,
        price: 180,
        currency: '$',
        img: 'https://images.unsplash.com/photo-1590073242678-70ee3fc28f8e?w=1000&q=80',
        gallery: [
          'https://images.unsplash.com/photo-1590073242678-70ee3fc28f8e?w=1000&q=80',
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80'
        ],
        amenities: ['Rooftop Vertigo Bar piso 61', 'Banyan Tree Spa', 'Piscina al Aire Libre', 'Crucero Apsara Dinner'],
        tag: 'Lujo',
        address: '21/100 South Sathon Road, Bangkok, Tailandia',
        description: 'Un oasis de elegancia asiática en el distrito financiero de Bangkok, famoso mundialmente por su restaurante al aire libre Vertigo & Moon Bar en el piso 61.',
        meta_description: 'Banyan Tree Bangkok. Hotel de lujo en Tailandia con el icónico bar en la azotea Vertigo y spa galardonado.'
      }
    ]
  end
end