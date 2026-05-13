class DestinationsController < ApplicationController
  def index
  end

  def show
    @slug = params[:slug]
    @destination = destination_data(@slug)
  end

  private

  def destination_data(slug)
    data = {
      'kioto-japon' => {
        name: 'Kioto', country: 'Japón', rating: '4.9', reviews: '18.5k', price_range: '$$$',
        best_season: 'Mar-May / Oct-Nov', timezone: 'UTC+9', currency: 'JPY', language: 'Japonés',
        cover_image: 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=1200&q=80',
        images: [
          'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?w=600&q=80',
          'https://images.unsplash.com/photo-1490806843957-31f4c9a91c65?w=600&q=80',
          'https://images.unsplash.com/photo-1528360983277-13d401cdc186?w=600&q=80',
        ],
        description: 'Kioto es el corazón cultural de Japón, donde los templos centenarios, los jardines de bambú y las geishas tradicionales conviven con la modernidad. Con más de 2,000 templos y santuarios, esta ciudad ofrece una inmersión profunda en la esencia nipona.',
        tags: ['Cultural', 'Histórico', 'Espiritual', 'Gastronomía'],
        highlights: { templos: '2,000+', altares: '1,600', patrimonio_unesco: '17', visitantes_anuales: '50M' },
        best_for: 'Amantes de la cultura, fotógrafos, parejas',
        budget_luxury: '$350+', budget_mid: '$120-$250', budget_backpacker: '$50-$80',
        temp: '15°C · Templado', exchange: '1 USD = 149 JPY',
        season_peak: 'Abr (cerezos) · Nov (otoño)',
        season_value: 'Jun-Ago · Ene-Feb',
        activities: [
          { title: 'Templo Kinkaku-ji', desc: 'El Pabellón Dorado, uno de los templos más icónicos de Japón.', price: '$5', tag: 'Cultural', img: 'https://images.unsplash.com/photo-1528360983277-13d401cdc186?w=400&q=80' },
          { title: 'Bosque de Bambú Arashiyama', desc: 'Camina entre interminables cañas de bambú en un sendero mágico.', price: 'Gratis', tag: 'Naturaleza', img: 'https://images.unsplash.com/photo-1490806843957-31f4c9a91c65?w=400&q=80' },
          { title: 'Ceremonia del Té', desc: 'Participa en una auténtica ceremonia tradicional del té matcha.', price: '$30', tag: 'Cultural', img: 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=400&q=80' },
        ],
        hotels: [
          { name: 'Park Hyatt Kyoto', rating: '4.9', location: 'Higashiyama', price: 'Desde $650/noche', img: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=80' },
          { name: 'The Screen Hotel', rating: '4.6', location: 'Centro Kioto', price: 'Desde $180/noche', img: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=400&q=80' },
        ],
      },
      'la-fortuna-costa-rica' => {
        name: 'La Fortuna', country: 'Costa Rica', rating: '4.6', reviews: '8.2k', price_range: '$$',
        best_season: 'Dic-Abr', timezone: 'UTC-6', currency: 'CRC', language: 'Español',
        cover_image: 'https://images.unsplash.com/photo-1518186233392-c232efbf2373?w=1200&q=80',
        images: [
          'https://images.unsplash.com/photo-1534351590666-13e3e96b5017?w=600&q=80',
          'https://images.unsplash.com/photo-1505223852771-b2770d88e3ca?w=600&q=80',
          'https://images.unsplash.com/photo-1511497584788-876760111969?w=600&q=80',
        ],
        description: 'La Fortuna es la puerta de entrada al majestuoso Volcán Arenal. Aguas termales, bosques nubosos, cascadas imponentes y una biodiversidad asombrosa convierten este pueblo en el epicentro del ecoturismo costarricense.',
        tags: ['Ecoturismo', 'Aventura', 'Termal', 'Naturaleza'],
        highlights: { volcan_altura: '1,670m', cascadas: '5+', reservas: '3', aguas_termales: '8+' },
        best_for: 'Aventureros, amantes de la naturaleza, familias',
        budget_luxury: '$200+', budget_mid: '$80-$150', budget_backpacker: '$30-$50',
        temp: '26°C · Tropical', exchange: '1 USD = 510 CRC',
        season_peak: 'Dic-Abr (temporada seca)',
        season_value: 'May-Nov (temporada verde)',
        activities: [
          { title: 'Volcán Arenal', desc: 'Senderismo por coladas de lava petrificada con vistas al volcán.', price: '$15', tag: 'Aventura', img: 'https://images.unsplash.com/photo-1534351590666-13e3e96b5017?w=400&q=80' },
          { title: 'Aguas Termales', desc: 'Relájate en piscinas de aguas termales volcánicas naturales.', price: '$35', tag: 'Bienestar', img: 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400&q=80' },
          { title: 'Catarata La Fortuna', desc: 'Impressionante caída de agua de 75 metros en medio de la selva.', price: '$18', tag: 'Naturaleza', img: 'https://images.unsplash.com/photo-1505223852771-b2770d88e3ca?w=400&q=80' },
        ],
        hotels: [
          { name: 'Nayara Springs', rating: '4.9', location: 'Arenal', price: 'Desde $450/noche', img: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=80' },
          { name: 'Hotel Lomas del Volcán', rating: '4.5', location: 'La Fortuna', price: 'Desde $90/noche', img: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=400&q=80' },
        ],
      },
      'positano-italia' => {
        name: 'Positano', country: 'Italia', rating: '4.8', reviews: '12.1k', price_range: '$$$',
        best_season: 'Abr-Oct', timezone: 'UTC+1', currency: 'EUR', language: 'Italiano',
        cover_image: 'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?w=1200&q=80',
        images: [
          'https://images.unsplash.com/photo-1534008897995-27a23e859048?w=600&q=80',
          'https://images.unsplash.com/photo-1499678329028-3e8c0e5e6e3e?w=600&q=80',
          'https://images.unsplash.com/photo-1533104816931-20fa691ff6ca?w=600&q=80',
        ],
        description: 'Positano es la joya de la Costa Amalfitana. Sus casas de colores pastel se aferran a los acantilados frente al mar Tirreno. Calles empinadas, boutiques elegantes y playas de ensueño la convierten en el destino más fotogénico de Italia.',
        tags: ['Romántico', 'Costero', 'Gastronomía', 'Lujo'],
        highlights: { playas: '4', restaurantes: '80+', miradores: '10+', botes_excursion: '20+' },
        best_for: 'Parejas, fotógrafos, amantes del buen comer',
        budget_luxury: '$400+', budget_mid: '$150-$280', budget_backpacker: '$60-$100',
        temp: '24°C · Mediterráneo', exchange: '1 USD = 0.92 EUR',
        season_peak: 'Jun-Ago',
        season_value: 'Abr-May · Sep-Oct',
        activities: [
          { title: 'Excursión a Capri', desc: 'Navega hasta la isla de Capri y visita la Gruta Azul.', price: '$80', tag: 'Aventura', img: 'https://images.unsplash.com/photo-1533104816931-20fa691ff6ca?w=400&q=80' },
          { title: 'Camino de los Dioses', desc: 'Trekking con vistas panorámicas espectaculares de la costa.', price: 'Gratis', tag: 'Naturaleza', img: 'https://images.unsplash.com/photo-1499678329028-3e8c0e5e6e3e?w=400&q=80' },
          { title: 'Cata de Limoncello', desc: 'Degusta el licor tradicional de la Costa Amalfitana.', price: '$15', tag: 'Gastronomía', img: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400&q=80' },
        ],
        hotels: [
          { name: 'Le Sirenuse', rating: '4.9', location: 'Positano Centro', price: 'Desde $800/noche', img: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=80' },
          { name: 'Hotel Palazzo Murat', rating: '4.7', location: 'Positano', price: 'Desde $250/noche', img: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=400&q=80' },
        ],
      },
      'zermatt-suiza' => {
        name: 'Zermatt', country: 'Suiza', rating: '4.7', reviews: '9.8k', price_range: '$$$$',
        best_season: 'Dic-Abr / Jun-Sep', timezone: 'UTC+1', currency: 'CHF', language: 'Alemán, Francés',
        cover_image: 'https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=1200&q=80',
        images: [
          'https://images.unsplash.com/photo-1519681393784-d120267933ba?w=600&q=80',
          'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600&q=80',
        ],
        description: 'Zermatt es el paraíso de los amantes de la montaña. Ubicado a los pies del icónico Cervino (Matterhorn), ofrece algunas de las mejores pistas de esquí de Europa y senderos de verano espectaculares.',
        tags: ['Esquí', 'Montaña', 'Lujo', 'Aventura'],
        highlights: { pistas_esqui: '360km', telefericos: '54', altitud_max: '3,883m', restaurantes: '100+' },
        best_for: 'Esquiadores, alpinistas, familias',
        budget_luxury: '$600+', budget_mid: '$250-$400', budget_backpacker: '$100-$180',
        temp: '-2°C · Alpino', exchange: '1 USD = 0.88 CHF',
        season_peak: 'Dic-Mar / Jul-Ago',
        season_value: 'Abr-May · Sep-Oct',
        activities: [
          { title: 'Esquí en el Cervino', desc: '360 km de pistas con vistas al pico más famoso de los Alpes.', price: '$100/día', tag: 'Deporte', img: 'https://images.unsplash.com/photo-1519681393784-d120267933ba?w=400&q=80' },
          { title: 'Gornergrat Railway', desc: 'Tren panorámico con vistas al Monte Rosa y al Cervino.', price: '$50', tag: 'Cultural', img: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&q=80' },
        ],
        hotels: [
          { name: 'Mont Cervin Palace', rating: '4.9', location: 'Zermatt', price: 'Desde $700/noche', img: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=80' },
        ],
      },
    }
    data[slug] || data['kioto-japon']
  end
end
