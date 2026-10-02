import 'package:sem_sufoco/core/model/transaction.dart';

final List<Transaction> mockTransactions = [
  // =========================
  // Alimentação
  // =========================
  Transaction(
    id: 'transaction_001',
    purchasedAt: DateTime(2026, 7, 1, 12, 30),
    establishment: 'Restaurante Sabor',
    amount: 32.90,
    description: 'Almoço',
    categoryId: 'food',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_002',
    purchasedAt: DateTime(2026, 7, 3, 19, 20),
    establishment: 'McDonald\'s',
    amount: 28.50,
    description: 'Jantar',
    categoryId: 'food',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_003',
    purchasedAt: DateTime(2026, 7, 5, 8, 10),
    establishment: 'Padaria Blumenau',
    amount: 14.90,
    description: 'Café da manhã',
    categoryId: 'food',
    paymentMethod: PaymentMethod.cash,
  ),

  Transaction(
    id: 'transaction_004',
    purchasedAt: DateTime(2026, 7, 7, 13, 15),
    establishment: 'Burger House',
    amount: 41.90,
    description: 'Hambúrguer e batata',
    categoryId: 'food',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_005',
    purchasedAt: DateTime(2026, 7, 9, 12, 45),
    establishment: 'Restaurante do Vale',
    amount: 36.00,
    description: 'Almoço',
    categoryId: 'food',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_006',
    purchasedAt: DateTime(2026, 7, 11, 18, 40),
    establishment: 'Subway',
    amount: 25.90,
    description: 'Lanche',
    categoryId: 'food',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_007',
    purchasedAt: DateTime(2026, 7, 14, 11, 50),
    establishment: 'Panificadora Central',
    amount: 18.75,
    description: 'Salgado e café',
    categoryId: 'food',
    paymentMethod: PaymentMethod.cash,
  ),

  Transaction(
    id: 'transaction_008',
    purchasedAt: DateTime(2026, 7, 17, 20, 10),
    establishment: 'Pizza Itália',
    amount: 59.90,
    description: 'Pizza',
    categoryId: 'food',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_009',
    purchasedAt: DateTime(2026, 7, 20, 12, 20),
    establishment: 'Marmitas da Hora',
    amount: 27.00,
    description: 'Marmita',
    categoryId: 'food',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_010',
    purchasedAt: DateTime(2026, 7, 23, 16, 30),
    establishment: 'Café Central',
    amount: 16.50,
    description: 'Café e sobremesa',
    categoryId: 'food',
    paymentMethod: PaymentMethod.cash,
  ),

  Transaction(
    id: 'transaction_011',
    purchasedAt: DateTime(2026, 7, 26, 19, 45),
    establishment: 'China House',
    amount: 48.90,
    description: 'Comida chinesa',
    categoryId: 'food',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_012',
    purchasedAt: DateTime(2026, 7, 29, 12, 10),
    establishment: 'Bistrô Blumenau',
    amount: 44.90,
    description: 'Almoço',
    categoryId: 'food',
    paymentMethod: PaymentMethod.pix,
  ),

  // =========================
  // Moradia
  // =========================
  Transaction(
    id: 'transaction_013',
    purchasedAt: DateTime(2026, 7, 2, 9, 0),
    establishment: 'Celesc',
    amount: 145.80,
    description: 'Conta de energia',
    categoryId: 'housing',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_014',
    purchasedAt: DateTime(2026, 7, 3, 9, 30),
    establishment: 'Companhia de Água',
    amount: 78.40,
    description: 'Conta de água',
    categoryId: 'housing',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_015',
    purchasedAt: DateTime(2026, 7, 5, 10, 0),
    establishment: 'Aluguel',
    amount: 1400.00,
    description: 'Aluguel mensal',
    categoryId: 'housing',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_016',
    purchasedAt: DateTime(2026, 7, 7, 15, 20),
    establishment: 'Leroy Merlin',
    amount: 89.90,
    description: 'Materiais para casa',
    categoryId: 'housing',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_017',
    purchasedAt: DateTime(2026, 7, 10, 14, 10),
    establishment: 'Casa & Cia',
    amount: 64.90,
    description: 'Produtos para casa',
    categoryId: 'housing',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_018',
    purchasedAt: DateTime(2026, 7, 12, 16, 30),
    establishment: 'Havan',
    amount: 119.90,
    description: 'Utensílios domésticos',
    categoryId: 'housing',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_019',
    purchasedAt: DateTime(2026, 7, 15, 11, 40),
    establishment: 'Tok&Casa',
    amount: 72.50,
    description: 'Organização da casa',
    categoryId: 'housing',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_020',
    purchasedAt: DateTime(2026, 7, 18, 13, 20),
    establishment: 'Ferragem Central',
    amount: 45.80,
    description: 'Ferramentas',
    categoryId: 'housing',
    paymentMethod: PaymentMethod.cash,
  ),

  Transaction(
    id: 'transaction_021',
    purchasedAt: DateTime(2026, 7, 21, 10, 15),
    establishment: 'Lojas Koerich',
    amount: 159.90,
    description: 'Item para casa',
    categoryId: 'housing',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_022',
    purchasedAt: DateTime(2026, 7, 24, 17, 50),
    establishment: 'Casa Fácil',
    amount: 53.70,
    description: 'Produtos domésticos',
    categoryId: 'housing',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_023',
    purchasedAt: DateTime(2026, 7, 27, 14, 40),
    establishment: 'Lojas Quero-Quero',
    amount: 97.90,
    description: 'Manutenção da casa',
    categoryId: 'housing',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_024',
    purchasedAt: DateTime(2026, 7, 30, 16, 10),
    establishment: 'Mercado da Casa',
    amount: 68.90,
    description: 'Produtos domésticos',
    categoryId: 'housing',
    paymentMethod: PaymentMethod.debitCard,
  ),

  // =========================
  // Transporte
  // =========================
  Transaction(
    id: 'transaction_025',
    purchasedAt: DateTime(2026, 7, 1, 8, 20),
    establishment: 'Posto Ipiranga',
    amount: 80.00,
    description: 'Combustível',
    categoryId: 'transport',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_026',
    purchasedAt: DateTime(2026, 7, 4, 18, 30),
    establishment: 'Uber',
    amount: 19.80,
    description: 'Corrida',
    categoryId: 'transport',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_027',
    purchasedAt: DateTime(2026, 7, 6, 7, 45),
    establishment: 'Posto Shell',
    amount: 75.00,
    description: 'Combustível',
    categoryId: 'transport',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_028',
    purchasedAt: DateTime(2026, 7, 8, 19, 10),
    establishment: 'Uber',
    amount: 23.50,
    description: 'Corrida',
    categoryId: 'transport',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_029',
    purchasedAt: DateTime(2026, 7, 10, 9, 15),
    establishment: 'Posto Petrobras',
    amount: 90.00,
    description: 'Combustível',
    categoryId: 'transport',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_030',
    purchasedAt: DateTime(2026, 7, 13, 17, 40),
    establishment: 'Uber',
    amount: 17.90,
    description: 'Corrida',
    categoryId: 'transport',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_031',
    purchasedAt: DateTime(2026, 7, 16, 10, 30),
    establishment: 'Oficina do Vale',
    amount: 180.00,
    description: 'Manutenção da moto',
    categoryId: 'transport',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_032',
    purchasedAt: DateTime(2026, 7, 18, 8, 50),
    establishment: 'Posto Ipiranga',
    amount: 82.00,
    description: 'Combustível',
    categoryId: 'transport',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_033',
    purchasedAt: DateTime(2026, 7, 21, 18, 20),
    establishment: '99',
    amount: 21.40,
    description: 'Corrida',
    categoryId: 'transport',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_034',
    purchasedAt: DateTime(2026, 7, 23, 12, 30),
    establishment: 'Posto Shell',
    amount: 70.00,
    description: 'Combustível',
    categoryId: 'transport',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_035',
    purchasedAt: DateTime(2026, 7, 26, 9, 40),
    establishment: 'Auto Center Blumenau',
    amount: 120.00,
    description: 'Troca de óleo',
    categoryId: 'transport',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_036',
    purchasedAt: DateTime(2026, 7, 29, 20, 15),
    establishment: 'Uber',
    amount: 26.90,
    description: 'Corrida',
    categoryId: 'transport',
    paymentMethod: PaymentMethod.creditCard,
  ),

  // =========================
  // Saúde
  // =========================
  Transaction(
    id: 'transaction_037',
    purchasedAt: DateTime(2026, 7, 2, 15, 30),
    establishment: 'Farmácia Popular',
    amount: 35.90,
    description: 'Medicamentos',
    categoryId: 'health',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_038',
    purchasedAt: DateTime(2026, 7, 5, 10, 20),
    establishment: 'Drogaria Catarinense',
    amount: 48.70,
    description: 'Produtos de saúde',
    categoryId: 'health',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_039',
    purchasedAt: DateTime(2026, 7, 8, 14, 10),
    establishment: 'Clínica Saúde',
    amount: 120.00,
    description: 'Consulta',
    categoryId: 'health',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_040',
    purchasedAt: DateTime(2026, 7, 11, 16, 30),
    establishment: 'Farmácia Preço Popular',
    amount: 29.90,
    description: 'Medicamentos',
    categoryId: 'health',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_041',
    purchasedAt: DateTime(2026, 7, 13, 9, 45),
    establishment: 'Laboratório Vida',
    amount: 85.00,
    description: 'Exames',
    categoryId: 'health',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_042',
    purchasedAt: DateTime(2026, 7, 16, 13, 20),
    establishment: 'Drogaria Catarinense',
    amount: 42.50,
    description: 'Produtos de higiene',
    categoryId: 'health',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_043',
    purchasedAt: DateTime(2026, 7, 18, 11, 10),
    establishment: 'Farmácia Popular',
    amount: 31.80,
    description: 'Medicamentos',
    categoryId: 'health',
    paymentMethod: PaymentMethod.cash,
  ),

  Transaction(
    id: 'transaction_044',
    purchasedAt: DateTime(2026, 7, 20, 15, 40),
    establishment: 'Clínica Odonto',
    amount: 150.00,
    description: 'Consulta odontológica',
    categoryId: 'health',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_045',
    purchasedAt: DateTime(2026, 7, 23, 10, 30),
    establishment: 'Drogaria Catarinense',
    amount: 57.90,
    description: 'Medicamentos',
    categoryId: 'health',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_046',
    purchasedAt: DateTime(2026, 7, 25, 17, 20),
    establishment: 'Farmácia Popular',
    amount: 24.90,
    description: 'Produtos de saúde',
    categoryId: 'health',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_047',
    purchasedAt: DateTime(2026, 7, 27, 14, 50),
    establishment: 'Clínica Fisio',
    amount: 100.00,
    description: 'Sessão',
    categoryId: 'health',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_048',
    purchasedAt: DateTime(2026, 7, 30, 9, 20),
    establishment: 'Drogaria Preço Popular',
    amount: 39.90,
    description: 'Medicamentos',
    categoryId: 'health',
    paymentMethod: PaymentMethod.creditCard,
  ),

  // =========================
  // Lazer
  // =========================
  Transaction(
    id: 'transaction_049',
    purchasedAt: DateTime(2026, 7, 2, 20, 30),
    establishment: 'Cinema Norte',
    amount: 32.00,
    description: 'Ingresso de cinema',
    categoryId: 'leisure',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_050',
    purchasedAt: DateTime(2026, 7, 5, 18, 10),
    establishment: 'Boliche Blumenau',
    amount: 65.00,
    description: 'Boliche',
    categoryId: 'leisure',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_051',
    purchasedAt: DateTime(2026, 7, 8, 19, 40),
    establishment: 'Steam',
    amount: 49.90,
    description: 'Jogo',
    categoryId: 'leisure',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_052',
    purchasedAt: DateTime(2026, 7, 11, 21, 0),
    establishment: 'Netflix',
    amount: 44.90,
    description: 'Assinatura',
    categoryId: 'leisure',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_053',
    purchasedAt: DateTime(2026, 7, 14, 16, 20),
    establishment: 'Parque Vila Germânica',
    amount: 25.00,
    description: 'Passeio',
    categoryId: 'leisure',
    paymentMethod: PaymentMethod.cash,
  ),

  Transaction(
    id: 'transaction_054',
    purchasedAt: DateTime(2026, 7, 17, 20, 15),
    establishment: 'Cinema Norte',
    amount: 38.00,
    description: 'Cinema',
    categoryId: 'leisure',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_055',
    purchasedAt: DateTime(2026, 7, 19, 15, 30),
    establishment: 'Spotify',
    amount: 21.90,
    description: 'Assinatura',
    categoryId: 'leisure',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_056',
    purchasedAt: DateTime(2026, 7, 22, 18, 45),
    establishment: 'Steam',
    amount: 79.90,
    description: 'Jogo',
    categoryId: 'leisure',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_057',
    purchasedAt: DateTime(2026, 7, 24, 20, 20),
    establishment: 'Hamburgueria Central',
    amount: 55.90,
    description: 'Saída com amigos',
    categoryId: 'leisure',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_058',
    purchasedAt: DateTime(2026, 7, 26, 14, 10),
    establishment: 'Parque Aquático',
    amount: 90.00,
    description: 'Passeio',
    categoryId: 'leisure',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_059',
    purchasedAt: DateTime(2026, 7, 28, 19, 30),
    establishment: 'Cinema Norte',
    amount: 35.00,
    description: 'Cinema',
    categoryId: 'leisure',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_060',
    purchasedAt: DateTime(2026, 7, 31, 20, 45),
    establishment: 'Restaurante do Vale',
    amount: 72.00,
    description: 'Jantar de lazer',
    categoryId: 'leisure',
    paymentMethod: PaymentMethod.creditCard,
  ),

  // =========================
  // Compras
  // =========================
  Transaction(
    id: 'transaction_061',
    purchasedAt: DateTime(2026, 7, 3, 14, 20),
    establishment: 'Amazon',
    amount: 89.90,
    description: 'Compra online',
    categoryId: 'shopping',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_062',
    purchasedAt: DateTime(2026, 7, 6, 16, 40),
    establishment: 'Havan',
    amount: 119.90,
    description: 'Roupas',
    categoryId: 'shopping',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_063',
    purchasedAt: DateTime(2026, 7, 9, 11, 30),
    establishment: 'Shopee',
    amount: 45.90,
    description: 'Compra online',
    categoryId: 'shopping',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_064',
    purchasedAt: DateTime(2026, 7, 12, 15, 10),
    establishment: 'Renner',
    amount: 139.90,
    description: 'Roupas',
    categoryId: 'shopping',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_065',
    purchasedAt: DateTime(2026, 7, 15, 13, 50),
    establishment: 'Mercado Livre',
    amount: 72.90,
    description: 'Compra online',
    categoryId: 'shopping',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_066',
    purchasedAt: DateTime(2026, 7, 18, 17, 20),
    establishment: 'C&A',
    amount: 99.90,
    description: 'Roupas',
    categoryId: 'shopping',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_067',
    purchasedAt: DateTime(2026, 7, 20, 10, 40),
    establishment: 'Amazon',
    amount: 54.90,
    description: 'Acessório',
    categoryId: 'shopping',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_068',
    purchasedAt: DateTime(2026, 7, 22, 16, 30),
    establishment: 'Shopee',
    amount: 38.90,
    description: 'Compra online',
    categoryId: 'shopping',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_069',
    purchasedAt: DateTime(2026, 7, 24, 14, 20),
    establishment: 'Magazine Luiza',
    amount: 159.90,
    description: 'Eletrônico',
    categoryId: 'shopping',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_070',
    purchasedAt: DateTime(2026, 7, 27, 18, 10),
    establishment: 'Renner',
    amount: 79.90,
    description: 'Roupas',
    categoryId: 'shopping',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_071',
    purchasedAt: DateTime(2026, 7, 29, 12, 50),
    establishment: 'Mercado Livre',
    amount: 65.90,
    description: 'Compra online',
    categoryId: 'shopping',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_072',
    purchasedAt: DateTime(2026, 7, 31, 15, 40),
    establishment: 'Havan',
    amount: 129.90,
    description: 'Produtos diversos',
    categoryId: 'shopping',
    paymentMethod: PaymentMethod.pix,
  ),

  // =========================
  // Educação
  // =========================
  Transaction(
    id: 'transaction_073',
    purchasedAt: DateTime(2026, 7, 2, 19, 30),
    establishment: 'Udemy',
    amount: 39.90,
    description: 'Curso online',
    categoryId: 'education',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_074',
    purchasedAt: DateTime(2026, 7, 5, 14, 20),
    establishment: 'Amazon',
    amount: 59.90,
    description: 'Livro',
    categoryId: 'education',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_075',
    purchasedAt: DateTime(2026, 7, 8, 18, 10),
    establishment: 'Alura',
    amount: 89.90,
    description: 'Curso online',
    categoryId: 'education',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_076',
    purchasedAt: DateTime(2026, 7, 11, 13, 40),
    establishment: 'Saraiva',
    amount: 74.90,
    description: 'Livro',
    categoryId: 'education',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_077',
    purchasedAt: DateTime(2026, 7, 14, 20, 20),
    establishment: 'Udemy',
    amount: 49.90,
    description: 'Curso de programação',
    categoryId: 'education',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_078',
    purchasedAt: DateTime(2026, 7, 17, 15, 30),
    establishment: 'Amazon',
    amount: 42.90,
    description: 'Livro técnico',
    categoryId: 'education',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_079',
    purchasedAt: DateTime(2026, 7, 20, 19, 40),
    establishment: 'Alura',
    amount: 89.90,
    description: 'Curso online',
    categoryId: 'education',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_080',
    purchasedAt: DateTime(2026, 7, 22, 16, 10),
    establishment: 'Livraria Catarinense',
    amount: 68.90,
    description: 'Livro',
    categoryId: 'education',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_081',
    purchasedAt: DateTime(2026, 7, 24, 18, 50),
    establishment: 'Udemy',
    amount: 34.90,
    description: 'Curso online',
    categoryId: 'education',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_082',
    purchasedAt: DateTime(2026, 7, 27, 13, 20),
    establishment: 'Amazon',
    amount: 55.90,
    description: 'Livro',
    categoryId: 'education',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_083',
    purchasedAt: DateTime(2026, 7, 29, 20, 10),
    establishment: 'Curso Online',
    amount: 79.90,
    description: 'Material de estudo',
    categoryId: 'education',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_084',
    purchasedAt: DateTime(2026, 7, 31, 15, 50),
    establishment: 'Livraria Catarinense',
    amount: 47.90,
    description: 'Livro',
    categoryId: 'education',
    paymentMethod: PaymentMethod.debitCard,
  ),

  // =========================
  // Outros
  // =========================
  Transaction(
    id: 'transaction_085',
    purchasedAt: DateTime(2026, 7, 1, 10, 30),
    establishment: 'Correios',
    amount: 28.50,
    description: 'Envio de encomenda',
    categoryId: 'other',
    paymentMethod: PaymentMethod.cash,
  ),

  Transaction(
    id: 'transaction_086',
    purchasedAt: DateTime(2026, 7, 4, 15, 20),
    establishment: 'Pet Shop',
    amount: 75.90,
    description: 'Produtos para pet',
    categoryId: 'other',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_087',
    purchasedAt: DateTime(2026, 7, 7, 11, 40),
    establishment: 'Pet Shop',
    amount: 49.90,
    description: 'Ração',
    categoryId: 'other',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_088',
    purchasedAt: DateTime(2026, 7, 10, 16, 10),
    establishment: 'Lavanderia Central',
    amount: 35.00,
    description: 'Lavagem de roupas',
    categoryId: 'other',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_089',
    purchasedAt: DateTime(2026, 7, 13, 14, 30),
    establishment: 'Pet Shop',
    amount: 62.90,
    description: 'Areia para gatos',
    categoryId: 'other',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_090',
    purchasedAt: DateTime(2026, 7, 16, 10, 20),
    establishment: 'Correios',
    amount: 21.90,
    description: 'Envio',
    categoryId: 'other',
    paymentMethod: PaymentMethod.cash,
  ),

  Transaction(
    id: 'transaction_091',
    purchasedAt: DateTime(2026, 7, 19, 17, 40),
    establishment: 'Pet Shop',
    amount: 89.90,
    description: 'Ração',
    categoryId: 'other',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_092',
    purchasedAt: DateTime(2026, 7, 22, 12, 10),
    establishment: 'Lavanderia Central',
    amount: 42.00,
    description: 'Lavagem',
    categoryId: 'other',
    paymentMethod: PaymentMethod.debitCard,
  ),

  Transaction(
    id: 'transaction_093',
    purchasedAt: DateTime(2026, 7, 25, 15, 30),
    establishment: 'Pet Shop',
    amount: 55.90,
    description: 'Produtos para gatos',
    categoryId: 'other',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_094',
    purchasedAt: DateTime(2026, 7, 27, 11, 50),
    establishment: 'Correios',
    amount: 31.70,
    description: 'Envio de encomenda',
    categoryId: 'other',
    paymentMethod: PaymentMethod.pix,
  ),

  Transaction(
    id: 'transaction_095',
    purchasedAt: DateTime(2026, 7, 29, 18, 20),
    establishment: 'Pet Shop',
    amount: 74.90,
    description: 'Produtos para pet',
    categoryId: 'other',
    paymentMethod: PaymentMethod.creditCard,
  ),

  Transaction(
    id: 'transaction_096',
    purchasedAt: DateTime(2026, 7, 31, 13, 40),
    establishment: 'Lavanderia Central',
    amount: 38.00,
    description: 'Lavagem de roupas',
    categoryId: 'other',
    paymentMethod: PaymentMethod.debitCard,
  ),
];
