class HotelsController < ApplicationController
  def index
    @hotels = hotel_data
    @destinations = @hotels.map { |h| h[:destination] }.uniq.sort
    @price_ranges = ['Económico', 'Moderado', 'Lujo']
    @star_options = [1, 2, 3, 4, 5]
  end

  private

  def hotel_data
    [
      { name: 'Park Hyatt Kyoto', destination: 'Kioto', country: 'Japón', stars: 5, rating: 4.9, price: 650, currency: '$', img: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=600&q=80', amenities: ['Spa', 'Gimnasio', 'Restaurante', 'Concierge 24h'], tag: 'Lujo', description: 'Lujo en el corazón cultural de Japón, junto al Santuario Yasaka.' },
      { name: 'The Screen Hotel', destination: 'Kioto', country: 'Japón', stars: 4, rating: 4.6, price: 180, currency: '$', img: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=600&q=80', amenities: ['Restaurante', 'Bar', 'WiFi'], tag: 'Boutique', description: 'Hotel boutique moderno en el centro de Kioto con diseño minimalista.' },
      { name: 'Nayara Springs', destination: 'La Fortuna', country: 'Costa Rica', stars: 5, rating: 4.9, price: 450, currency: '$', img: 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=600&q=80', amenities: ['Aguas Termales', 'Spa', 'Piscina', 'Restaurante'], tag: 'Lujo', description: 'Resort boutique con aguas termales privadas en la selva tropical.' },
      { name: 'Hotel Lomas del Volcán', destination: 'La Fortuna', country: 'Costa Rica', stars: 3, rating: 4.5, price: 90, currency: '$', img: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=600&q=80', amenities: ['Piscina', 'WiFi', 'Desayuno'], tag: 'Económico', description: 'Vistas espectaculares al Volcán Arenal con relación calidad-precio inmejorable.' },
      { name: 'Le Sirenuse', destination: 'Positano', country: 'Italia', stars: 5, rating: 4.9, price: 800, currency: '$', img: 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=600&q=80', amenities: ['Spa', 'Restaurante Michelin', 'Piscina', 'Bar'], tag: 'Lujo', description: 'Icono de la Costa Amalfitana con vistas panorámicas al mar Tirreno.' },
      { name: 'Hotel Palazzo Murat', destination: 'Positano', country: 'Italia', stars: 4, rating: 4.7, price: 250, currency: '$', img: 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600&q=80', amenities: ['Restaurante', 'Jardín', 'WiFi'], tag: 'Boutique', description: 'Palacio histórico del siglo XVIII en el corazón de Positano.' },
      { name: 'Mont Cervin Palace', destination: 'Zermatt', country: 'Suiza', stars: 5, rating: 4.9, price: 700, currency: '$', img: 'https://images.unsplash.com/photo-1602002418082-a4443e081dd1?w=600&q=80', amenities: ['Spa', 'Piscina', 'Restaurante', 'Esquí'], tag: 'Lujo', description: 'Hotel legendario a los pies del Cervino con acceso directo a pistas.' },
      { name: 'Ritz Paris', destination: 'París', country: 'Francia', stars: 5, rating: 4.8, price: 1200, currency: '$', img: 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=600&q=80', amenities: ['Spa', 'Restaurante Michelin', 'Piscina', 'Concierge'], tag: 'Lujo', description: 'El epítome del lujo parisino en la Plaza Vendôme.' },
      { name: 'Hôtel des Arts Montmartre', destination: 'París', country: 'Francia', stars: 3, rating: 4.4, price: 120, currency: '$', img: 'https://images.unsplash.com/photo-1455587734955-081b22074882?w=600&q=80', amenities: ['WiFi', 'Desayuno', 'Terraza'], tag: 'Económico', description: 'Encantador hotel boutique en el corazón de Montmartre.' },
      { name: 'Aman Tokyo', destination: 'Tokio', country: 'Japón', stars: 5, rating: 4.9, price: 900, currency: '$', img: 'https://images.unsplash.com/photo-1601918774946-25832a4be0d6?w=600&q=80', amenities: ['Spa', 'Piscina', 'Restaurante', 'Gimnasio'], tag: 'Lujo', description: 'Santuario de lujo en las alturas de Tokio con vistas al Monte Fuji.' },
      { name: 'Hotel Gracery Shinjuku', destination: 'Tokio', country: 'Japón', stars: 3, rating: 4.3, price: 110, currency: '$', img: 'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=600&q=80', amenities: ['Restaurante', 'WiFi', 'Convenience Store'], tag: 'Económico', description: 'Ubicación perfecta en Shinjuku con el icónico Godzilla en la azotea.' },
      { name: 'Athénée Palm Beach', destination: 'Dubái', country: 'EAU', stars: 5, rating: 4.7, price: 550, currency: '$', img: 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=600&q=80', amenities: ['Spa', 'Playa Privada', 'Piscina', 'Restaurante'], tag: 'Lujo', description: 'Resort frente al mar en la icónica Palm Jumeirah.' },
      { name: 'Iberostar Selection', destination: 'Cancún', country: 'México', stars: 4, rating: 4.5, price: 200, currency: '$', img: 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=600&q=80', amenities: ['Todo Incluido', 'Spa', 'Piscina', 'Playa'], tag: 'Familiar', description: 'Resort todo incluido frente al Caribe mexicano con actividades para toda la familia.' },
      { name: 'Banyan Tree Bangkok', destination: 'Bangkok', country: 'Tailandia', stars: 5, rating: 4.7, price: 180, currency: '$', img: 'https://images.unsplash.com/photo-1590073242678-70ee3fc28f8e?w=600&q=80', amenities: ['Spa', 'Piscina', 'Restaurante', 'Bar'], tag: 'Lujo', description: 'Oasis de lujo en el corazón de Bangkok con vistas panorámicas.' },
    ]
  end
end