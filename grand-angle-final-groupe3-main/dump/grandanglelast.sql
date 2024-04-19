-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 18 mars 2024 à 15:22
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `grandanglelast`
--

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

CREATE TABLE `artiste` (
  `Id_Artiste` int(11) NOT NULL,
  `Nom_Artiste` varchar(150) NOT NULL,
  `Prenom_Artiste` varchar(50) DEFAULT NULL,
  `Email_Artiste` varchar(150) NOT NULL,
  `tel_Artiste` varchar(50) DEFAULT NULL,
  `id_DirArt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `artiste`
--

INSERT INTO `artiste` (`Id_Artiste`, `Nom_Artiste`, `Prenom_Artiste`, `Email_Artiste`, `tel_Artiste`, `id_DirArt`) VALUES
(1, 'Darroudi', 'Iran', '', '', 3),
(2, 'Attar', 'Abbas', '', '', 3),
(3, 'Neyestani', 'Mana', 'mana.neyestani@gmail.com', '06 52 45 87 54', NULL),
(4, 'Neshat', 'Shirin', 'shirin.neshat@gmail.com', '06 52 45 77 54', NULL),
(5, 'Walker', 'Kara', 'kara.walker@gmail.com', '06 52 45 67 54', NULL),
(6, 'Yu', 'Chang', '', '', 2),
(7, 'Zao', 'Wou-Ki', '', '', 2),
(8, 'Murakami', 'Takashi', 'takashi.murakami@gmail.com', '06 23 45 67 54', NULL),
(9, 'Orlinski', 'Richard', 'richard.orlinski@gmail.com', '06 52 65 67 54', NULL),
(10, 'Tanavoli', 'Parviz', '', '', 1),
(11, 'Chabert', 'Pierre-Jean', 'pierrejean.chabert@gmail.com', '06 02 65 67 54', NULL),
(12, 'Freud', 'Lucian', '', '', 3),
(13, 'Koons', 'Jeff', 'jeff.koons@gmail.com', '06 52 65 67 34', NULL),
(15, 'Sattouf', 'Riad', 'riad.sattouf@gmail.com', '06 52 65 67 64', NULL),
(16, 'Satrapi', 'Marjan', 'marjan.satrapi@gmail.com', '06 52 65 67 44', NULL),
(17, 'Deghati', 'Reza', '', '', 1),
(18, 'Golestan', 'Kave', '', '', 1),
(19, 'Novin', 'Guity', '', '', 1),
(20, 'Messager', 'Annette', 'annette.messager@gmail.com', '06 52 85 67 44', NULL),
(21, 'Kusama', 'Yayoi', 'kusama.yayoi@gmail.com', '06 52 55 67 44', NULL),
(22, 'Mohasses', 'Bahman', '', '', 1),
(23, 'Sierra', 'Santiago', 'santiago.sierra@gmail.com', '06 52 15 67 44', NULL),
(24, 'Soulages', 'Pierre', '', '', 5),
(25, 'Morris', 'Robert', '', '', 4),
(26, 'Petgar', 'Ali Asghar', '', '', 1),
(27, 'Petgar', 'Jafar', '', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `audio`
--

CREATE TABLE `audio` (
  `id_Audio` int(11) NOT NULL,
  `libelle_Audio` varchar(50) DEFAULT NULL,
  `chemin_Audio` varchar(255) DEFAULT NULL,
  `libelle_Langue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `bio_artist`
--

CREATE TABLE `bio_artist` (
  `Id_bio` int(11) NOT NULL,
  `description_artist` text,
  `chemin_Imgart` varchar(255) DEFAULT NULL,
  `Id_Langue` int(11) NOT NULL,
  `Id_Artiste` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bio_artist`
--

INSERT INTO `bio_artist` (`Id_bio`, `description_artist`, `chemin_Imgart`, `Id_Langue`, `Id_Artiste`) VALUES
(1, 'Iran Darroudi, née le 22 avril 1936 à Téhéran, est une artiste iranienne de renommée internationale, célèbre pour ses contributions remarquables à la scène artistique contemporaine. Elle a étudié les beaux-arts à l\'École des beaux-arts de Téhéran et a ensuite poursuivi ses études à l\'École nationale supérieure des beaux-arts de Paris.\nLe style artistique d\'Iran Darroudi est polyvalent, s\'étendant de l\'abstraction géométrique à des expressions plus figuratives. Elle a maîtrisé divers médiums, notamment la peinture à l\'huile, la calligraphie, la céramique et la sculpture. Darroudi a influencé la scène artistique iranienne en tant que membre du groupe \"Saqqakhaneh\", un mouvement qui a fusionné les éléments de l\'art traditionnel iranien avec des influences contemporaines.\nSon travail reflète souvent des thèmes profonds et des questions existentielles, explorant la spiritualité, la nature humaine et la dualité de la tradition et de la modernité. Darroudi a participé à de nombreuses expositions individuelles et collectives à travers le monde, consolidant sa réputation d\'artiste visionnaire et innovante.\nAu-delà de sa carrière artistique, Iran Darroudi a également joué un rôle important en tant que conservatrice de musée et éducatrice, contribuant à l\'évolution de l\'éducation artistique en Iran. Son engagement envers l\'art en tant que moyen d\'expression et de compréhension transcende les frontières culturelles, faisant d\'elle une figure emblématique de la scène artistique contemporaine en Iran.\n', 'iran-darroudi.jpg', 1, 1),
(2, 'Iran Darroudi, born on April 22, 1936, in Tehran, is an internationally renowned Iranian artist, celebrated for her remarkable contributions to the contemporary art scene. She studied fine arts at the Tehran School of Fine Arts and later continued her studies at the National School of Fine Arts in Paris.\nIran Darroudi\'s artistic style is versatile, ranging from geometric abstraction to more figurative expressions. She has mastered various mediums, including oil painting, calligraphy, ceramics, and sculpture. Darroudi has influenced the Iranian art scene as a member of the \"Saqqakhaneh\" group, a movement that merged elements of traditional Iranian art with contemporary influences.\nHer work often reflects profound themes and existential questions, exploring spirituality, human nature, and the duality of tradition and modernity. Darroudi has participated in numerous solo and group exhibitions worldwide, solidifying her reputation as a visionary and innovative artist.\nBeyond her artistic career, Iran Darroudi has also played a significant role as a museum curator and educator, contributing to the evolution of art education in Iran. Her commitment to art as a means of expression and understanding transcends cultural boundaries, making her an iconic figure in the contemporary art scene in Iran.\n', 'iran-darroudi.jpg', 2, 1),
(3, 'Iran Darroudi, geboren am 22. April 1936 in Teheran, ist eine international renommierte iranische Künstlerin, berühmt für ihre bemerkenswerten Beiträge zur zeitgenössischen Kunstszene. Sie studierte Bildende Kunst an der Teheran School of Fine Arts und setzte ihr Studium später an der National School of Fine Arts in Paris fort.\nDer künstlerische Stil von Iran Darroudi ist vielseitig und reicht von geometrischer Abstraktion bis zu figurativeren Ausdrucksformen. Sie hat verschiedene Medien beherrscht, darunter Ölmalerei, Kalligrafie, Keramik und Skulptur. Darroudi hat die iranische Kunstszene als Mitglied der Gruppe \"Saqqakhaneh\" beeinflusst, einer Bewegung, die Elemente der traditionellen iranischen Kunst mit zeitgenössischen Einflüssen verschmolz.\nIhre Arbeit spiegelt oft tiefgreifende Themen und existenzielle Fragen wider, die Spiritualität, die menschliche Natur und die Dualität von Tradition und Moderne erforschen. Darroudi hat an zahlreichen Einzel- und Gruppenausstellungen weltweit teilgenommen und sich so den Ruf als visionäre und innovative Künstlerin erworben.\nÜber ihre künstlerische Karriere hinaus hat Iran Darroudi auch eine bedeutende Rolle als Museumskuratorin und Pädagogin gespielt, was zur Entwicklung der Kunsterziehung im Iran beigetragen hat. Ihr Engagement für Kunst als Ausdrucks- und Verständigungsmittel überschreitet kulturelle Grenzen und macht sie zu einer ikonischen Figur in der zeitgenössischen Kunstszene im Iran.', 'iran-darroudi.jpg', 3, 1),
(4, 'ایران درودی، هنرمند بین‌المللی ایرانی، متولد ۲۲ آوریل ۱۹۳۶ در تهران است. وی به‌خاطر مشارکت‌های برجسته‌اش در عرصه هنر معاصر، مشهور است. او در دانشکده هنرهای زیبای تهران تحصیل کرد و سپس در دانشکده ملی هنرهای زیبای پاریس ادامه تحصیل داد.\nسبک هنری ایران درودی چندوجهی است و از انتزاع هندسی تا بیان‌های انتزاعی‌تر را در بر می‌گیرد. او در انواع رسانه‌ها، از جمله نقاشی روغنی، خوشنویسی، سرامیک و مجسمه‌سازی، مهارت دارد. درودی به‌عنوان عضو گروه «سنگ‌تراشی»، جنبشی که عناصر هنر سنتی ایرانی را با تأثیرات معاصر ترکیب کرد، بر صحنه هنری ایران تأثیر گذاشت.\nکار او اغلب موضوعات عمیق و مسائل وجودی را منعکس می‌کند، از جمله روحانیت، ماهیت انسان و دوگانگی سنت و مدرنیته. درودی در بسیاری از نمایشگاه‌های انفرادی و گروهی در سراسر جهان شرکت کرده است و شهرت خود را به‌عنوان هنرمندی پیشگام و نوآور تثبیت کرده است.\nعلاوه بر حرفه هنری خود، ایران درودی همچنین نقش مهمی در زمینه موزه‌داری و آموزش ایفا کرده است و به پیشرفت آموزش هنری در ایران کمک کرده است. تعهد او به هنر به‌عنوان وسیله‌ای برای بیان و درک، مرزهای فرهنگی را درنوردیده و او را به چهره‌ای نمادین در صحنه هنر معاصر ایران تبدیل کرده است.', 'iran-darroudi.jpg', 4, 1),
(5, '伊朗·达鲁迪（Iran Darroudi），国际知名的伊朗艺术家，因其对当代艺术领域的杰出贡献而闻名。她出生于1936年4月22日的德黑兰，在德黑兰美术学院学习美术，后来在巴黎国立高等美术学院继续深造。\n伊朗·达鲁迪的艺术风格多样，从几何抽象到更具表现力的表达。她精通各种媒介，包括油画、书法、陶瓷和雕塑。达鲁迪作为“萨克卡罕”小组的成员，对伊朗艺术界产生了影响，该小组将传统伊朗艺术元素与当代影响力相融合。\n她的作品经常反映深刻的主题和存在主义问题，探索了精神性、人性和传统与现代性的二元性。达鲁迪在世界各地参加了许多个展和联展，巩固了她作为具有前瞻性和创新精神的艺术家的声誉。\n除了她的艺术生涯之外，伊朗·达鲁迪还在博物馆馆长和教育工作者方面发挥了重要作用，为伊朗艺术教育的发展做出了贡献。她对艺术作为表达和理解的手段的承诺超越了文化界限，使她成为伊朗当代艺术界的一个标志性人物。', 'iran-darroudi.jpg', 6, 1),
(6, 'Abbar Attas est un écrivain et philosophe né en 1951 à Tanger, au Maroc. Il est connu pour ses travaux sur la pensée arabo-musulmane et la philosophie islamique. Attas a étudié à l\'Université Mohammed V à Rabat, puis a poursuivi ses études supérieures en France. Il a publié plusieurs ouvrages traitant de la spiritualité, de la philosophie et de la culture arabo-musulmane. Ses idées ont influencé de nombreux intellectuels dans le monde arabe et au-delà.', 'abbas-attar.jpg', 1, 2),
(7, 'Abbar Attas is a writer and philosopher born in 1951 in Tangier, Morocco. He is known for his work on Arab-Muslim thought and Islamic philosophy. Attas studied at Mohammed V University in Rabat, then pursued further studies in France. He has published several works dealing with spirituality, philosophy, and Arab-Muslim culture. His ideas have influenced many intellectuals in the Arab world and beyond.', 'abbas-attar.jpg', 2, 2),
(8, 'Abbar Attas ist ein Schriftsteller und Philosoph, der 1951 in Tanger, Marokko, geboren wurde. Er ist bekannt für seine Arbeit zum arabisch-muslimischen Denken und zur islamischen Philosophie. Attas studierte an der Universität Mohammed V in Rabat und setzte dann seine Studien in Frankreich fort. Er hat mehrere Werke über Spiritualität, Philosophie und die arabische-muslimische Kultur veröffentlicht. Seine Ideen haben viele Intellektuelle im arabischen Raum und darüber hinaus beeinflusst.', 'abbas-attar.jpg', 3, 2),
(9, 'Abbar Attas نویسنده و فیلسوفی است که در سال ۱۹۵۱ در تنگیر، مراکش، متولد شده است. او به خاطر کار خود درباره اندیشه عربی-اسلامی و فلسفه اسلامی شناخته می‌شود. عطاس در دانشگاه محمد پنجم در رباط تحصیل کرد و سپس تحصیلات خود را در فرانسه ادامه داد. او چندین اثر در زمینه معنویت، فلسفه و فرهنگ عربی-اسلامی منتشر کرده است. ایده‌های او بر روی بسیاری از فکرشناسان در جهان عرب و فراتر از آن تاثیر گذاشته است.', 'abbas-attar.jpg', 4, 2),
(10, 'Abbar Attas 是一位出生于 1951 年摩洛哥丹吉尔的作家和哲学家。他以其对阿拉伯-穆斯林思想和伊斯兰哲学的研究而闻名。Attas 在拉巴特的穆罕默德五世大学学习，然后在法国继续深造。他发表了几部涉及精神、哲学和阿拉伯-穆斯林文化的著作。他的思想影响了许多阿拉伯世界以及更广泛地区的知识分子。', 'abbas-attar.jpg', 6, 2),
(11, 'Neyestani Mana est une illustratrice et auteure iranienne née à Téhéran en 1973. Elle est connue pour ses bandes dessinées et ses livres jeunesse. Diplômée en arts graphiques de l\'Université de Téhéran, elle a travaillé pour divers journaux et magazines en Iran. En 2006, elle a été récompensée par le prix du meilleur illustrateur jeunesse iranien. Neyestani Mana est reconnue pour son style artistique distinctif et ses histoires captivantes qui abordent souvent des thèmes sociaux et politiques. Ses œuvres ont été publiées en Iran et à l\'étranger, et elle continue d\'inspirer de nombreux lecteurs à travers le monde.', 'mana-neyestani.jpg', 1, 3),
(12, 'Neyestani Mana is an Iranian illustrator and author born in Tehran in 1973. She is known for her comic strips and children\'s books. Graduating in graphic arts from the University of Tehran, she has worked for various newspapers and magazines in Iran. In 2006, she was awarded the Best Iranian Children\'s Illustrator Prize. Neyestani Mana is recognized for her distinctive artistic style and engaging stories that often address social and political themes. Her works have been published in Iran and abroad, continuing to inspire many readers worldwide.', 'mana-neyestani.jpg', 2, 3),
(13, 'Neyestani Mana ist eine iranische Illustratorin und Autorin, die 1973 in Teheran geboren wurde. Sie ist bekannt für ihre Comics und Kinderbücher. Mit einem Abschluss in Grafikdesign von der Universität Teheran hat sie für verschiedene Zeitungen und Magazine im Iran gearbeitet. Im Jahr 2006 wurde sie mit dem Preis für den besten iranischen Kinderbuch-Illustrator ausgezeichnet. Neyestani Mana ist bekannt für ihren unverwechselbaren künstlerischen Stil und fesselnde Geschichten, die oft soziale und politische Themen behandeln. Ihre Werke wurden im Iran und im Ausland veröffentlicht und inspirieren weiterhin viele Leser weltweit.', 'mana-neyestani.jpg', 3, 3),
(14, 'Neyestani Mana نیستانی مانا یک نقاش و نویسنده ایرانی است که در سال ۱۹۷۳ در تهران متولد شده است. او به خاطر نقاشی‌های کمیک و کتاب‌های کودکان شناخته می‌شود. با دریافت مدرک هنرهای تصویری از دانشگاه تهران، او برای چندین روزنامه و مجله در ایران کار کرده است. در سال ۲۰۰۶، او برنده جایزه بهترین نقاش کتاب کودک ایران شد. Neyestani Mana برای سبک هنری خاص و داستان‌های جذابش که اغلب به موضوعات اجتماعی و سیاسی می‌پردازند، شناخته شده است. آثار او در ایران و خارج از کشور منتشر شده و همچنان بسیاری از خوانندگان در سراسر جهان را الهام می‌دهد.', 'mana-neyestani.jpg', 4, 3),
(15, 'Neyestani Mana 是一位伊朗插画家和作家，出生于 1973 年的德黑兰。她以她的连环漫画和儿童书籍而闻名。她毕业于德黑兰大学的平面艺术专业，曾在伊朗的各种报纸和杂志工作。2006年，她被授予最佳伊朗儿童插画家奖。Neyestani Mana 以其独特的艺术风格和引人入胜的故事而闻名，这些故事经常涉及社会和政治主题。她的作品在伊朗和国外出版，继续激励着全球许多读者。', 'mana-neyestani.jpg', 6, 3),
(16, 'Shirin Neshat est une artiste iranienne née en 1957 à Qazvin. Connu pour son travail photographique et cinématographique, elle explore les thèmes de l\'identité, du genre et de la politique dans le contexte iranien. Après avoir étudié aux États-Unis, elle a commencé à créer des œuvres qui ont attiré une reconnaissance internationale. Ses photographies en noir et blanc, souvent associées à des vers calligraphiques persans, sont emblématiques de son style distinctif. Neshat a remporté de nombreux prix prestigieux pour son travail, et ses expositions ont été présentées dans des galeries et des musées du monde entier.', 'shirin-neshat.jpg', 1, 4),
(17, 'Shirin Neshat is an Iranian artist born in 1957 in Qazvin. Known for her photographic and cinematic work, she explores themes of identity, gender, and politics within the Iranian context. After studying in the United States, she began creating works that garnered international recognition. Her black-and-white photographs, often paired with Persian calligraphic verses, are emblematic of her distinctive style. Neshat has won numerous prestigious awards for her work, and her exhibitions have been showcased in galleries and museums worldwide.', 'shirin-neshat.jpg', 2, 4),
(18, 'Shirin Neshat ist eine iranische Künstlerin, die 1957 in Qazvin geboren wurde. Bekannt für ihre fotografische und filmische Arbeit, erforscht sie Themen wie Identität, Geschlecht und Politik im iranischen Kontext. Nach ihrem Studium in den Vereinigten Staaten begann sie, Werke zu schaffen, die internationale Anerkennung fanden. Ihre schwarz-weißen Fotografien, oft in Verbindung mit persischen kalligrafischen Versen, sind charakteristisch für ihren unverwechselbaren Stil. Neshat hat zahlreiche renommierte Auszeichnungen für ihre Arbeit erhalten, und ihre Ausstellungen wurden in Galerien und Museen auf der ganzen Welt präsentiert.', 'shirin-neshat.jpg', 3, 4),
(19, '\nشیرین نشاط هنرمند ایرانی است که در سال ۱۹۵۷ در قزوین متولد شد. شناخته شده به خاطر کارهای عکاسی و سینمایی‌اش، او موضوعاتی همچون هویت، جنسیت و سیاست را در زمینه ایران بررسی می‌کند. پس از تحصیل در ایالات متحده، او آثاری را آفرید که شهرت بین‌المللی بدست آورد. عکس‌های سیاه و سفید او که اغلب با آیات خطی فارسی همراه هستند، نمادین از سبک متمایز او هستند. نشاط برای کارش تعداد زیادی جایزه معتبر را به دست آ\n', 'shirin-neshat.jpg', 4, 4),
(20, '西琳·内沙特（Shirin Neshat）是一位伊朗裔美国艺术家，1957年出生于伊朗卡兹温。1979年伊朗革命后，她流亡美国。她的作品探索传统与现代、男性与女性、政治与个人之间的紧张关系，涵盖摄影、视频和视觉艺术。她以黑白摄影系列和社会批判电影《无男之女》而闻名。她的作品在世界各地的知名艺术机构广受欢迎。内沙特因其大胆探索身份、宗教和权力等复杂现实而备受赞誉。', 'shirin-neshat.jpg', 6, 4),
(21, 'Kara Walker est une artiste américaine née en 1969 à Stockton, en Californie. Elle est connue pour son travail provocateur explorant les thèmes de la race, du genre et de l\'identité à travers l\'art de la silhouette. Ses œuvres, souvent controversées pour leur représentation franche de l\'esclavage et de l\'oppression, défient les attentes et interrogent les stéréotypes. Walker a reçu de nombreux prix et distinctions pour son travail novateur, notamment le prestigieux Prix MacArthur en 1997. Son art est exposé dans des musées et des galeries du monde entier, et elle continue à susciter la réflexion sur des questions sociales importantes à travers son travail.', 'kara-walker.jpg', 1, 5),
(22, 'Kara Walker is an American artist born in 1969 in Stockton, California. She is known for her provocative work exploring themes of race, gender, and identity through the art of silhouette. Her works, often controversial for their frank depiction of slavery and oppression, defy expectations and question stereotypes. Walker has received numerous awards and accolades for her innovative work, including the prestigious MacArthur Fellowship in 1997. Her art is exhibited in museums and galleries worldwide, and she continues to provoke thought on important social issues through her work.', 'kara-walker.jpg', 2, 5),
(23, 'Kara Walker ist eine amerikanische Künstlerin, geboren 1969 in Stockton, Kalifornien. Sie ist bekannt für ihre provokante Arbeit, die Themen wie Rasse, Geschlecht und Identität durch die Kunst der Silhouette erkundet. Ihre Werke, oft kontrovers für ihre offene Darstellung von Sklaverei und Unterdrückung, trotzen den Erwartungen und hinterfragen Stereotypen. Walker hat zahlreiche Auszeichnungen für ihre innovative Arbeit erhalten, darunter das renommierte MacArthur-Stipendium im Jahr 1997. Ihre Kunst wird weltweit in Museen und Galerien ausgestellt, und sie setzt weiterhin wichtige soziale Themen durch ihre Arbeit in den Fokus.', 'kara-walker.jpg', 3, 5),
(24, '\nکارا واکر هنرمند آمریکایی است که در سال ۱۹۶۹ در استاکتون، کالیفرنیا متولد شد. او برای کارهایی که موضوعات نژاد، جنسیت و هویت را از طریق هنر سایه‌نما بررسی می‌کنند، شناخته شده است. آثار واکر، اغلب برای تصویر روشنی که از برده‌داری و ستم ارائه می‌دهند، مورد اختلاف قرار می‌گیرند و انتظارات را چالش می‌کنند و استریوتایپ‌ها را سوال می‌کنند. واکر برای کار نوآورانه‌اش، جوایز و افتخارات بسیاری را دریافت کرده است، از جمله مک‌آرتور در سال ۱۹۹۷. هنر او در موزه‌ها و گالری‌های سراسر جهان به نمایش گذاشته شده است و او همچنان از طریق کارش در مورد موضوعات اجتماعی مهم به تفکر تحریک می‌کند.', 'kara-walker.jpg', 4, 5),
(25, '卡拉·沃克（Kara Walker）是一位美国艺术家，1969年出生于加利福尼亚州的斯托克顿。她以挑衅性作品而闻名，通过剪影艺术探索种族、性别和身份的主题。她的作品常因其直率描绘奴隶制度和压迫而引起争议，挑战着观众的期待并质疑刻板印象。沃克因其创新性工作而获得了许多奖项和荣誉，包括1997年的杰出人才奖。她的艺术作品在世界各地的博物馆和画廊展出，通过作品继续引发人们对重要社会问题的思考。', 'kara-walker.jpg', 6, 5),
(26, 'Yu Chang est un artiste chinois asiatique moderne et contemporain, né en 1957. Le travail de Yu Chang a été proposé aux enchères à plusieurs reprises, avec des prix réalisés allant de 9 779 USD à 12 139 USD, selon la taille et le médium de l\'œuvre d\'art. Depuis 2016, le prix record pour cet artiste aux enchères est de 12 139 USD pour -40°C, vendu aux enchères par China Guardian Auctions à Beijing en 2016. Dans les archives de presse artistique de MutualArt, Yu Chang est présenté dans un article intitulé \"La parcours créatif de l\'artiste mis en valeur\", paru dans China Daily en janvier 2020.', 'yu-chang.jpg', 1, 6),
(27, 'Yu Chang is a Chinese Asian Modern & Contemporary artist who was born in 1957. Yu Chang\'s work has been offered at auction multiple times, with realized prices ranging from 9,779 USD to 12,139 USD, depending on the size and medium of the artwork. Since 2016 the record price for this artist at auction is 12,139 USD for -40°C, sold at China Guardian Auctions, Beijing in 2016. In MutualArt’s artist press archive, Yu Chang is featured in Artist\'s Creative Journey Highlighted, a piece from China Daily in January 2020.\n', 'yu-chang.jpg', 2, 6),
(28, 'Yu Chang ist ein chinesischer asiatischer moderner und zeitgenössischer Künstler, geboren 1957. Das Werk von Yu Chang wurde mehrmals auf Auktionen angeboten, wobei die erzielten Preise je nach Größe und Medium des Kunstwerks zwischen 9.779 USD und 12.139 USD lagen. Seit 2016 liegt der Rekordpreis für diesen Künstler bei einer Auktion bei 12.139 USD für -40°C, verkauft bei China Guardian Auctions in Peking im Jahr 2016. In den Künstlerpressenarchiven von MutualArt wird Yu Chang in einem Artikel mit dem Titel \"Künstlerische Schaffensreise hervorgehoben\" aus China Daily vom Januar 2020 vorgestellt.', 'yu-chang.jpg', 3, 6),
(29, '\nیو چانگ یک هنرمند معاصر و معاصر چینی آسیایی است که در سال ۱۹۵۷ متولد شده است. کار یو چانگ چندین بار در حراجی عرضه شده است، با قیمت‌های واقعی که بین ۹٬۷۷۹ دلار تا ۱۲٬۱۳۹ دلار متغیر است، بسته به اندازه و رسانه‌ی هنر. از سال ۲۰۱۶ تا کنون، بالاترین قیمت ثبت‌شده برای این هنرمند در حراجی ۱۲٬۱۳۹ دلار برای اثر -40°C است که در حراجی گاردین چین، بیجینگ در سال ۲۰۱۶ فروخته شد. در بایگانی مطبوعات هنرمندی MutualArt، یو چانگ در مقاله‌ای با عنوان \"سفر خلاقانه هنرمند مورد توجه\"، که در چاینا دیلی در ژانویه ۲۰۲۰ منتشر شده است، شرکت داشته است.', 'yu-chang.jpg', 4, 6),
(30, '余昌是一位中国现代和当代艺术家，出生于1957年。余昌的作品已多次在拍卖会上拍卖，实现的价格根据作品的大小和媒介不同，介于9,779美元到12,139美元之间。自2016年以来，该艺术家在拍卖会上的最高记录价格为12,139美元，该作品为《-40°C》，于2016年在北京中国嘉德拍卖会上售出。在MutualArt的艺术家新闻档案中，余昌在2020年1月的《中国日报》中被介绍为“艺术家创意之旅的亮点”。', 'yu-chang.jpg', 6, 6),
(31, 'Zao Wou-Ki, de son vrai nom Zhao Wuji, était un peintre chinois-français né en 1920 à Pékin, en Chine, et décédé en 2013 à Nyon, en Suisse. Il est reconnu comme l\'un des artistes les plus importants du XXe siècle, célèbre pour ses peintures abstraites qui fusionnent les traditions chinoises et occidentales. Zao Wou-Ki a étudié la peinture à l\'École des beaux-arts de Hangzhou avant de s\'installer à Paris en 1948, où il a développé son style distinctif. Son travail a été exposé dans le monde entier et il a reçu de nombreuses distinctions, y compris le prestigieux prix de la Fondation Guggenheim en 1958.', 'zao-wou-ki.jpg', 1, 7),
(32, 'Zao Wou-Ki, born Zhao Wuji, was a Chinese-French painter born in 1920 in Beijing, China, and passed away in 2013 in Nyon, Switzerland. He is recognized as one of the most important artists of the 20th century, famous for his abstract paintings that merge Chinese and Western traditions. Zao Wou-Ki studied painting at the Hangzhou School of Fine Arts before settling in Paris in 1948, where he developed his distinctive style. His work has been exhibited worldwide, and he received numerous accolades, including the prestigious Guggenheim Foundation Prize in 1958.', 'zao-wou-ki.jpg', 2, 7),
(33, 'Zao Wou-Ki, geboren als Zhao Wuji, war ein chinesisch-französischer Maler, geboren 1920 in Peking, China, und verstarb 2013 in Nyon, Schweiz. Er gilt als einer der bedeutendsten Künstler des 20. Jahrhunderts, berühmt für seine abstrakten Gemälde, die chinesische und westliche Traditionen verschmelzen. Zao Wou-Ki studierte Malerei an der Hochschule für Bildende Künste in Hangzhou, bevor er sich 1948 in Paris niederließ, wo er seinen charakteristischen Stil entwickelte. Seine Werke wurden weltweit ausgestellt, und er erhielt zahlreiche Auszeichnungen, darunter den renommierten Guggenheim Foundation Prize im Jahr 1958.', 'zao-wou-ki.jpg', 3, 7),
(34, '\nزائو وو-کی، با نام واقعی زاو ووجی، نقاش چینی-فرانسوی بود که در سال ۱۹۲۰ در پکن، چین متولد شد و در سال ۲۰۱۳ در نیون، سوئیس درگذشت. او به عنوان یکی از مهم‌ترین هنرمندان قرن بیستم شناخته می‌شود، معروف به نقاشی‌های انتزاعی که سنت‌های چینی و غربی را ترکیب می‌کنند. زائو وو-کی تحصیلات خود را در دانشکده هنرهای زیبا هانگژو آغاز کرد و پس از آن در سال ۱۹۴۸ به پاریس مهاجرت کرد، جایی که سبک مشخص خود را توسعه داد. او از نمایشگاه‌هایی در سراسر جهان شرکت کرده و از جوایز متعددی از جمله جایزه موسسه گوگنهایم در سال ۱۹۵۸ برخوردار شد.', 'zao-wou-ki.jpg', 4, 7),
(35, '赵无极，原名赵无继，是一位出生于1920年中国北京、于2013年逝世于瑞士尼永的中法画家。他被认为是20世纪最重要的艺术家之一，以其将中国和西方传统融合的抽象画而闻名。赵无极在杭州美术学院学习绘画，随后于1948年定居巴黎，在那里他发展出了自己独特的风格。他的作品在世界各地展出，并获得了许多荣誉，包括1958年的古根海姆基金会奖。', 'zao-wou-ki.jpg', 6, 7),
(36, 'Takashi Murakami est un artiste contemporain japonais né en 1962 à Tokyo. Il est célèbre pour son style distinctif, mêlant l\'art traditionnel japonais avec la culture pop et l\'esthétique anime. Murakami est le fondateur du mouvement artistique Superflat, qui rejette les distinctions entre l\'art « élevé » et « bas ». Son travail comprend une variété de médias, y compris la peinture, la sculpture, la performance et les médias numériques. Il a collaboré avec de nombreuses marques et personnalités, notamment Louis Vuitton et Kanye West. Murakami a exposé ses œuvres dans des musées et des galeries du monde entier, et son influence sur la culture populaire contemporaine est indéniable.', 'takashi-murakami.jpg', 1, 8),
(37, 'Takashi Murakami is a Japanese contemporary artist born in 1962 in Tokyo. He is famous for his distinctive style, blending traditional Japanese art with pop culture and anime aesthetics. Murakami is the founder of the Superflat artistic movement, which rejects distinctions between \"high\" and \"low\" art. His work encompasses a variety of media, including painting, sculpture, performance, and digital media. He has collaborated with numerous brands and personalities, including Louis Vuitton and Kanye West. Murakami has exhibited his works in museums and galleries worldwide, and his influence on contemporary popular culture is undeniable.', 'takashi-murakami.jpg', 2, 8),
(38, 'Takashi Murakami ist ein zeitgenössischer japanischer Künstler, geboren 1962 in Tokio. Er ist bekannt für seinen unverwechselbaren Stil, der traditionelle japanische Kunst mit Popkultur und Anime-Ästhetik verbindet. Murakami ist der Gründer der künstlerischen Bewegung Superflat, die Unterscheidungen zwischen \"hoher\" und \"niedriger\" Kunst ablehnt. Sein Werk umfasst eine Vielzahl von Medien, darunter Malerei, Skulptur, Performance und digitale Medien. Er hat mit zahlreichen Marken und Persönlichkeiten zusammengearbeitet, darunter Louis Vuitton und Kanye West. Murakami hat seine Werke in Museen und Galerien auf der ganzen Welt ausgestellt, und sein Einfluss auf die zeitgenössische Popkultur ist unbestreitbar.', 'takashi-murakami.jpg', 3, 8),
(39, '\nتاکاشی موراکامی هنرمند معاصر ژاپنی است که در سال ۱۹۶۲ در توکیو متولد شد. او به خاطر سبک خاص خودش مشهور است که هنر سنتی ژاپنی را با فرهنگ پاپ و آستانه‌های انیمه ترکیب می‌کند. موراکامی بنیانگذار جنبش هنری سوپرفلت است که تفاوت‌ها بین \"هنر بالا\" و \"هنر پایین\" را رد می‌کند. کار او شامل مجموعه‌ای از رسانه‌ها است، شامل نقاشی، مجسمه‌سازی، اجرا و رسانه‌های دیجیتال. او با برندها و شخصیت‌های متعددی همکاری کرده است، از جمله لویی ویتون و کانیه وست. موراکامی اثرهای خود را در موزه‌ها و گالری‌های سراسر جهان نمایش داده است و تأثیر او بر فرهنگ پاپ معاصر بدیهی است.', 'takashi-murakami.jpg', 4, 8),
(40, '村上隆是一位日本当代艺术家，1962年出生于东京。他以独特的风格闻名，将传统日本艺术与流行文化和动漫美学相融合。村上隆是超扁平艺术运动的创始人，该运动拒绝了“高级”和“低级”艺术之间的区别。他的作品涵盖了各种媒介，包括绘画、雕塑、表演和数字媒体。他与许多品牌和名人合作过，包括路易威登和坎耶·韦斯特。村上隆的作品在世界各地的博物馆和画廊展出，他对当代流行文化的影响不可否认。', 'takashi-murakami.jpg', 6, 8),
(41, '\nRichard Orlinski est un artiste contemporain français né en 1966 à Paris. Il est surtout connu pour ses sculptures animalières et ses œuvres abstraites, caractérisées par des lignes épurées et des formes géométriques. Avant de se consacrer entièrement à l\'art, Orlinski a travaillé dans le secteur du marketing et de la publicité. Son style audacieux et reconnaissable a rapidement attiré l\'attention, ce qui lui a valu une renommée internationale. Ses sculptures en acier, en résine ou en bronze sont exposées dans des galeries et des espaces publics à travers le monde. Orlinski est également un musicien accompli, ajoutant une dimension supplémentaire à sa créativité artistique.', 'richard-orlinski.jpg', 1, 9),
(42, 'Richard Orlinski is a French contemporary artist born in 1966 in Paris. He is best known for his animal sculptures and abstract works, characterized by clean lines and geometric shapes. Before dedicating himself fully to art, Orlinski worked in the marketing and advertising sector. His bold and recognizable style quickly gained attention, earning him international fame. His sculptures in steel, resin, or bronze are exhibited in galleries and public spaces worldwide. Orlinski is also an accomplished musician, adding an additional dimension to his artistic creativity.', 'richard-orlinski.jpg', 2, 9),
(43, 'Richard Orlinski ist ein französischer zeitgenössischer Künstler, geboren 1966 in Paris. Er ist am besten für seine Tierfiguren-Skulpturen und abstrakten Werke bekannt, die sich durch klare Linien und geometrische Formen auszeichnen. Bevor er sich ganz der Kunst widmete, arbeitete Orlinski im Marketing- und Werbesektor. Sein kühner und wiedererkennbarer Stil erregte schnell Aufmerksamkeit und brachte ihm internationale Berühmtheit ein. Seine Skulpturen aus Stahl, Harz oder Bronze werden weltweit in Galerien und öffentlichen Räumen ausgestellt. Orlinski ist auch ein talentierter Musiker, der seiner künstlerischen Kreativität eine zusätzliche Dimension verleiht.', 'richard-orlinski.jpg', 3, 9),
(44, '\nریچارد اورلینسکی هنرمند معاصر فرانسوی است که در سال ۱۹۶۶ در پاریس متولد شد. او بهترین به دلیل مجسمه‌های حیوانی و اثار انتزاعی خودش شناخته می‌شود که با خطوط تمیز و اشکال هندسی مشخص می‌شوند. پیش از اینکه به طور کامل به هنر اختصاص دهد، اورلینسکی در بخش بازاریابی و تبلیغات کار می‌کرد. سبک جسور و قابل تشخیص او به سرعت توجه را به خود جلب کرد و به او شهرت جهانی را فراهم کرد. مجسمه‌های او از فولاد، رزین یا برنز در گالری‌ها و فضاهای عمومی در سراسر جهان نمایش داده می‌شوند. اورلینسکی همچنین یک موسیقیدان با استعداد است که به خلاقیت هنری‌اش بعد دیگری اضافه می‌کند.', 'richard-orlinski.jpg', 4, 9),
(45, '理查德·奥尔林斯基（Richard Orlinski）是一位法国当代艺术家，1966年出生于巴黎。他以动物雕塑和抽象作品闻名，以简洁的线条和几何形状为特色。在完全致力于艺术之前，奥尔林斯基曾在营销和广告领域工作。他大胆而独特的风格迅速引起了人们的关注，赢得了国际声誉。他的钢铁、树脂或青铜雕塑作品在世界各地的画廊和公共空间展出。奥尔林斯基还是一位技艺高超的音乐家，为他的艺术创造力增添了额外的维度。\n\n\n\n\n', 'richard-orlinski.jpg', 6, 9),
(46, 'Parviz Tanavoli est un artiste contemporain iranien né en 1937 à Téhéran. Il est reconnu comme l\'un des artistes les plus importants du Moyen-Orient, célèbre pour ses sculptures métalliques inspirées par l\'art traditionnel iranien et les symboles culturels. Tanavoli a étudié à l\'École des Beaux-Arts de Téhéran et à l\'Accademia di Belle Arti à Rome. Son œuvre explore des thèmes tels que la mythologie, la religion et la calligraphie, reflétant la richesse et la profondeur de la culture iranienne. Il a exposé ses œuvres dans des musées et des galeries du monde entier et a reçu de nombreux prix pour sa contribution à l\'art contemporain.', 'parviz-tanavoli.jpg', 1, 10),
(47, 'Parviz Tanavoli is a contemporary Iranian artist born in 1937 in Tehran. He is recognized as one of the most important artists in the Middle East, famous for his metal sculptures inspired by traditional Iranian art and cultural symbols. Tanavoli studied at the Tehran School of Fine Arts and the Accademia di Belle Arti in Rome. His work explores themes such as mythology, religion, and calligraphy, reflecting the richness and depth of Iranian culture. He has exhibited his works in museums and galleries worldwide and has received numerous awards for his contribution to contemporary art.', 'parviz-tanavoli.jpg', 2, 10),
(48, 'Parviz Tanavoli ist ein zeitgenössischer iranischer Künstler, geboren 1937 in Teheran. Er wird als einer der wichtigsten Künstler im Nahen Osten anerkannt und ist berühmt für seine Metallskulpturen, die von der traditionellen iranischen Kunst und kulturellen Symbolen inspiriert sind. Tanavoli studierte an der Tehran School of Fine Arts und der Accademia di Belle Arti in Rom. Sein Werk erforscht Themen wie Mythologie, Religion und Kalligrafie und spiegelt die Reichhaltigkeit und Tiefe der iranischen Kultur wider. Er hat seine Werke in Museen und Galerien auf der ganzen Welt ausgestellt und hat zahlreiche Auszeichnungen für seinen Beitrag zur zeitgenössischen Kunst erhalten.', 'parviz-tanavoli.jpg', 3, 10),
(49, '\nپرویز تناولی هنرمند معاصر ایرانی است که در سال ۱۹۳۷ در تهران متولد شد. او به عنوان یکی از مهم‌ترین هنرمندان خاورمیانه شناخته می‌شود، معروف به مجسمه‌سازی‌های فلزی‌اش که تحت تأثیر هنر سنتی ایرانی و نمادهای فرهنگی قرار می‌گیرند. تناولی در دانشکده هنرهای زیبای تهران و Accademia di Belle Arti در رم تحصیل کرده است. اثر او موضوعاتی مانند اسطوره‌شناسی، دین و خطاطی را بررسی می‌کند و غنای فرهنگ و عمق فرهنگ ایرانی را منعکس می‌کند. او اثار خود را در موزه‌ها و گالری‌های سراسر جهان نمایش داده و برای مشارکت در هنر معاصر، جوایز بسیاری دریافت کرده است.', 'parviz-tanavoli.jpg', 4, 10),
(50, '帕尔维兹·塔纳沃利（Parviz Tanavoli）是一位伊朗当代艺术家，1937年出生于德黑兰。他被认为是中东地区最重要的艺术家之一，以受传统伊朗艺术和文化符号启发的金属雕塑而闻名。塔纳沃利曾就读于德黑兰美术学校和罗马的美术学院。他的作品探索了诸如神话、宗教和书法等主题，反映了伊朗文化的丰富性和深度。他的作品在世界各地的博物馆和画廊展出，并因其对当代艺术的贡献而获得了众多奖项。', 'parviz-tanavoli.jpg', 6, 10),
(51, '\nPierre Jean Chabert, né en 1968 à Paris, est un artiste contemporain français. Il est surtout connu pour ses sculptures en métal et ses installations artistiques qui explorent les thèmes de la nature, de la technologie et de la société moderne. Chabert a étudié les beaux-arts à l\'École nationale supérieure des beaux-arts de Paris. Son travail se caractérise par une esthétique industrielle et une réflexion sur les enjeux contemporains. Ses œuvres ont été exposées dans des galeries et des musées à travers le monde. Chabert continue d\'explorer de nouvelles avenues artistiques et d\'inspirer par son approche innovante et engagée.', 'pierre-jean-chabert.jpg', 1, 11),
(52, 'Pierre Jean Chabert, born in 1968 in Paris, is a French contemporary artist. He is best known for his metal sculptures and artistic installations that explore themes of nature, technology, and modern society. Chabert studied fine arts at the École nationale supérieure des beaux-arts in Paris. His work is characterized by an industrial aesthetic and a reflection on contemporary issues. His pieces have been exhibited in galleries and museums worldwide. Chabert continues to explore new artistic avenues and inspire with his innovative and engaged approach.', 'pierre-jean-chabert.jpg', 2, 11),
(53, 'Pierre Jean Chabert, geboren 1968 in Paris, ist ein französischer zeitgenössischer Künstler. Er ist am besten für seine Metallskulpturen und künstlerischen Installationen bekannt, die Themen wie Natur, Technologie und moderne Gesellschaft erforschen. Chabert studierte Bildende Kunst an der École nationale supérieure des beaux-arts in Paris. Seine Arbeit zeichnet sich durch eine industrielle Ästhetik und eine Reflexion über zeitgenössische Themen aus. Seine Werke wurden in Galerien und Museen auf der ganzen Welt ausgestellt. Chabert erkundet weiterhin neue künstlerische Wege und inspiriert mit seinem innovativen und engagierten Ansatz.', 'pierre-jean-chabert.jpg', 3, 11),
(54, '\nپیر ژان شابرت، متولد ۱۹۶۸ در پاریس، هنرمند معاصر فرانسوی است. او به خاطر مجسمه‌های فلزی و نصب‌های هنری‌اش که موضوعاتی از طبیعت، فناوری و جامعه مدرن را بررسی می‌کنند شناخته می‌شود. شابرت در دانشکده هنرهای زیبا در پاریس تحصیلات خود را گذرانده است. اثر او به یک زیبایی صنعتی و تفکری در مورد مسائل معاصر مشهور است. اثرهای او در گالری‌ها و موزه‌های سراسر جهان نمایش داده شده‌اند. شابرت همچنان به کاوش مسیرهای هنری جدید ادامه می‌دهد و با رویکرد نوآورانه و مشارکتی‌اش الهام بخش است.', 'pierre-jean-chabert.jpg', 4, 11),
(55, '皮埃尔·让·沙贝尔（Pierre Jean Chabert）出生于1968年，是一位法国当代艺术家，出生于巴黎。他以其探索自然、技术和现代社会主题的金属雕塑和艺术装置而闻名。沙贝尔在巴黎国立高等美术学院学习美术。他的作品以工业美学和对当代问题的反思而著称。他的作品曾在世界各地的画廊和博物馆展出。沙贝尔继续探索新的艺术途径，并以他的创新和投入的态度鼓舞人心。', 'pierre-jean-chabert.jpg', 6, 11),
(56, 'Lucian Freud, né le 8 décembre 1922, était un peintre britannique connu pour son art figuratif et ses portraits intensément pénétrants sur le plan psychologique. Petit-fils de Sigmund Freud, son œuvre explorait souvent les complexités de la psychologie humaine et de l\'émotion. Le style distinctif de Freud, caractérisé par une peinture épaisse et des portraits crus et impitoyables de ses sujets, lui a valu une reconnaissance et un succès généralisés en tant que l\'un des plus grands peintres figuratifs du XXe siècle. Il a peint de nombreuses figures notables, notamment des artistes, des amis et des membres de sa famille, capturant leur essence avec une profondeur et une perspicacité remarquables. L\'héritage de Freud continue d\'influencer l\'art contemporain, laissant une marque indélébile sur le monde de l\'art.', 'lucian-freud.jpg', 1, 12),
(57, '\nLucian Freud, born on December 8, 1922, was a British painter known for his figurative art and intense, psychologically penetrating portraits. As the grandson of Sigmund Freud, his work often delved into the complexities of human psychology and emotion. Freud\'s distinctive style, characterized by thickly applied paint and raw, unflinching portrayals of his subjects, earned him widespread acclaim and recognition as one of the foremost figurative painters of the 20th century. He painted many notable figures, including fellow artists, friends, and family members, capturing their essence with remarkable depth and insight. Freud\'s legacy continues to influence contemporary art, leaving an indelible mark on the art world.\n', 'lucian-freud.jpg', 2, 12),
(58, 'Lucian Freud, geboren am 8. Dezember 1922, war ein britischer Maler, bekannt für seine figurative Kunst und intensive, psychologisch durchdringende Porträts. Als Enkel von Sigmund Freud erforschte seine Arbeit oft die Komplexitäten der menschlichen Psychologie und Emotionen. Freuds unverwechselbarer Stil, gekennzeichnet durch dick aufgetragene Farbe und rohe, unerbittliche Darstellungen seiner Motive, brachte ihm weite Anerkennung und Anerkennung als einer der führenden figurativen Maler des 20. Jahrhunderts ein. Er malte viele bedeutende Persönlichkeiten, darunter Künstlerkollegen, Freunde und Familienmitglieder, und fing ihre Essenz mit bemerkenswerter Tiefe und Einsicht ein. Freuds Erbe beeinflusst weiterhin die zeitgenössische Kunst und hinterlässt einen unauslöschlichen Eindruck in der Kunstwelt.', 'lucian-freud.jpg', 3, 12),
(59, 'لوسیان فروید، متولد ۸ دسامبر ۱۹۲۲، نقاش بریتانیایی بود که به خاطر هنر تصویری و پرتره‌های شناور و روان‌شناختی‌اش شناخته می‌شد. به عنوان نوه سیگموند فروید، کار او اغلب در پی بررسی پیچیدگی‌های روان‌شناختی و احساسات انسانی بود. سبک ممتاز فروید، مشخص شده توسط رنگ‌های ضخیم و تصاویر تند و بی‌تردید افرادش، به او شهرت و تشخیص گسترده‌ای در عنوان یکی از معروف‌ترین نقاشان شکلی قرن بیستم را به دست آورد. او بسیاری از شخصیت‌های برجسته را نقاشی کرد، شامل همکاران هنری، دوستان و اعضای خانواده، با زمینه‌های ژرف و بصیرت قابل توجه. ارث فروید همچنان بر هنر معاصر تاثیرگذار است و علامتی بی‌پاک در جهان هنر گذاشته است.', 'lucian-freud.jpg', 4, 12),
(60, '卢西安·弗洛伊德，生于1922年12月8日，是一位英国画家，以其具象艺术和深入人心、心理穿透力的肖像而闻名。作为西格蒙德·弗洛伊德的孙子，他的作品常常探索人类心理和情感的复杂性。弗洛伊德独特的风格以厚涂颜料和对主题的生动、直接的刻画为特征，使他赢得了广泛的赞誉和认可，被认为是20世纪最重要的具象画家之一。他绘制了许多著名人物，包括艺术家、朋友和家庭成员，以出色的深度和洞察力捕捉他们的本质。弗洛伊德的遗产继续影响着当代艺术，给艺术世界留下了深刻的印记。', 'lucian-freud.jpg', 6, 12),
(61, 'Jeff Koons, né le 21 janvier 1955, est un artiste américain connu pour ses sculptures monumentales et ses œuvres provocatrices. Il a émergé dans les années 1980 pour son approche innovante de l\'art, brouillant les frontières entre la haute et la basse culture. Koons s\'inspire souvent d\'objets du quotidien et de la culture populaire, les transformant en sculptures monumentales qui remettent en question les notions traditionnelles de beauté et de valeur. Ses œuvres, telles que \"Balloon Dog\" et \"Rabbit\", ont atteint des prix record aux enchères, confirmant son statut de l\'un des artistes contemporains les plus influents. Malgré les controverses entourant son travail, Koons reste une figure très influente dans le monde de l\'art.', 'jeff-koons.jpg', 1, 13),
(62, 'Jeff Koons, born on January 21, 1955, is an American artist known for his larger-than-life sculptures and provocative artworks. He rose to prominence in the 1980s for his innovative approach to art, blurring the lines between high and low culture. Koons often draws inspiration from everyday objects and popular culture, transforming them into monumental sculptures that challenge traditional notions of beauty and value. His works, such as \"Balloon Dog\" and \"Rabbit,\" have fetched record-breaking prices at auctions, cementing his status as one of the most influential contemporary artists. Despite controversies surrounding his work, Koons remains a highly influential figure in the art world.', 'jeff-koons.jpg', 2, 13),
(63, 'Jeff Koons, geboren am 21. Januar 1955, ist ein amerikanischer Künstler, der für seine überlebensgroßen Skulpturen und provokativen Kunstwerke bekannt ist. Er wurde in den 1980er Jahren bekannt für seinen innovativen Ansatz zur Kunst, der die Grenzen zwischen hoher und niedriger Kultur verwischt. Koons lässt sich oft von Alltagsgegenständen und Popkultur inspirieren und verwandelt sie in monumentale Skulpturen, die traditionelle Vorstellungen von Schönheit und Wert herausfordern. Seine Werke wie \"Balloon Dog\" und \"Rabbit\" erzielten bei Auktionen Rekordpreise und festigten seinen Status als einer der einflussreichsten zeitgenössischen Künstler. Trotz der Kontroversen um seine Arbeit bleibt Koons eine hoch einflussreiche Figur in der Kunstwelt.', 'jeff-koons.jpg', 3, 13),
(64, 'جف کونز، متولد ۲۱ ژانویه ۱۹۵۵، هنرمند آمریکایی است که به خاطر مجسمه‌های بزرگتر از زندگی و آثاری که به چالش کشیدن نظرات مردم شهیر است. او در دهه ۱۹۸۰ به خاطر رویکرد نوآورانه‌اش در هنر شناخته شد که مرزهای بین فرهنگ بالا و پایین را آشفته کرد. کونز اغلب از اشیاء روزمره و فرهنگ عمومی الهام می‌گیرد و آن‌ها را به مجسمه‌هایی غول‌پیکر تبدیل می‌کند که مفاهیم سنتی زیبایی و ارزش را به چالش می‌کشد. آثار او، مانند \"سگ بادبادک\" و \"خرگوش\"، قیمت‌های بی‌سابقه‌ای در حراجی‌ها به دست آوردند و وضعیت او را به عنوان یکی از مهم‌ترین هنرمندان معاصر تثبیت کرد. با وجود اختلافاتی که در اطراف کار او وجود دارد، کونز همچنان یک شخصیت بسیار تاثیرگذار در دنیای هنر است.', 'jeff-koons.jpg', 4, 13),
(65, '杰夫·昆斯，生于1955年1月21日，是一位美国艺术家，以其巨大的雕塑和具有挑衅性的艺术作品而闻名。他在1980年代因其对艺术的创新方法而声名鹊起，模糊了高低文化之间的界限。昆斯经常从日常物品和流行文化中汲取灵感，将它们转化为挑战传统美学和价值观念的巨型雕塑。他的作品，如《气球狗》和《兔子》，在拍卖会上创下了创纪录的价格，巩固了他作为最具影响力的当代艺术家之一的地位。尽管他的作品常常引发争议，但昆斯仍然是艺术界中备受推崇的重要人物。', 'jeff-koons.jpg', 6, 13),
(66, 'Riad Sattouf, né le 5 mai 1978, est un auteur de bande dessinée et réalisateur français d\'origine syrienne. Il est célèbre pour sa série de bandes dessinées autobiographiques \"L\'Arabe du futur\", qui raconte son enfance en Libye et en Syrie. Sattouf est également connu pour ses films, dont \"Les Beaux Gosses\", qui lui a valu le César du meilleur premier film en 2010. Son travail explore souvent des thèmes tels que l\'identité, la culture et les différences sociales avec humour et sensibilité, ce qui lui a valu une large reconnaissance internationale.', 'riad-sattouf.jpg', 1, 15),
(67, 'Riad Sattouf, born on May 5, 1978, is a French comic book author and filmmaker of Syrian origin. He is famous for his autobiographical comic book series \"The Arab of the Future,\" which recounts his childhood in Libya and Syria. Sattouf is also known for his films, including \"The French Kissers,\" which earned him the César Award for Best First Feature Film in 2010. His work often explores themes such as identity, culture, and social differences with humor and sensitivity, earning him broad international recognition.', 'riad-sattouf.jpg', 2, 15),
(68, 'Riad Sattouf, geboren am 5. Mai 1978, ist ein französischer Comicautor und Regisseur syrischer Herkunft. Er ist bekannt für seine autobiografische Comicreihe \"Der Araber von morgen\", die seine Kindheit in Libyen und Syrien schildert. Sattouf ist auch für seine Filme bekannt, darunter \"Die Schönen der Nacht\", für den er 2010 den César für den besten Erstlingsfilm erhielt. Seine Arbeit erforscht oft Themen wie Identität, Kultur und soziale Unterschiede mit Humor und Sensibilität, was ihm eine breite internationale Anerkennung eingebracht hat.', 'riad-sattouf.jpg', 3, 15),
(69, 'ریاض سطوف، متولد ۵ مه ۱۹۷۸، نویسنده و کارگردان کمیک و فیلم فرانسوی سوری است. او برای مجموعه کمیک‌های خود به نام \"عرب آینده\" شناخته می‌شود که دوران کودکی او را در لیبی و سوریه روایت می‌کند. سطوف همچنین برای فیلم‌هایش شناخته شده است، از جمله \"بچه‌های زیبا\" که به او جایزه سزار بهترین فیلم اولیه را در سال ۲۰۱۰ اعطا کرد. کار او اغلب موضوعاتی از جمله هویت، فرهنگ و تفاوت‌های اجتماعی را با شوخ‌طبعی و حساسیت بررسی می‌کند که باعث شناخت وسیعی در سطح بین‌المللی شده است.', 'riad-sattouf.jpg', 4, 15),
(70, 'Riad Sattouf，生于1978年5月5日，是一位法国漫画作家和叙利亚裔导演。他以自传漫画系列《未来的阿拉伯人》而闻名，该系列讲述了他在利比亚和叙利亚的童年。萨图夫还以其电影而闻名，其中《美好的小伙子们》于2010年获得了最佳处女作塞萨尔奖。他的作品经常探讨身份、文化和社会差异等主题，以幽默和敏感性为特色，因此赢得了广泛的国际认可。', 'imageartistriad-sattouf.jpg', 6, 15),
(71, 'Marjane Satrapi, née le 22 novembre 1969, est une autrice de bandes dessinées, illustratrice et réalisatrice franco-iranienne. Elle est surtout connue pour ses romans graphiques autobiographiques \"Persepolis\", qui décrivent son enfance et ses premières années d\'adulte en Iran pendant et après la révolution islamique. Le travail de Satrapi se caractérise par ses illustrations audacieuses en noir et blanc et son récit franc, offrant des aperçus poignants de la société et de la politique iraniennes. Son adaptation cinématographique acclamée de \"Persepolis\" a reçu des éloges généralisés et de nombreux prix. Satrapi continue de créer une art qui explore les thèmes de l\'identité, de l\'oppression et de la résilience, faisant d\'elle une voix importante dans la littérature et le cinéma contemporains.', 'marjan-satrapi.jpg', 1, 16),
(72, 'Marjane Satrapi, born on November 22, 1969, is an Iranian-French graphic novelist, illustrator, and film director. She is best known for her autobiographical graphic novels \"Persepolis,\" which depict her childhood and early adult years in Iran during and after the Islamic Revolution. Satrapi\'s work is characterized by its bold black-and-white illustrations and candid storytelling, offering poignant insights into Iranian society and politics. Her critically acclaimed film adaptation of \"Persepolis\" received widespread praise and numerous awards. Satrapi continues to create thought-provoking art that explores themes of identity, oppression, and resilience, making her a prominent voice in contemporary literature and cinema.', 'marjan-satrapi.jpg', 2, 16),
(73, 'Marjane Satrapi, geboren am 22. November 1969, ist eine iranisch-französische Graphic-Novel-Autorin, Illustratorin und Filmregisseurin. Sie ist am besten bekannt für ihre autobiografischen Graphic Novels \"Persepolis\", die ihre Kindheit und frühen Erwachsenenjahre im Iran während und nach der Islamischen Revolution darstellen. Satrapis Werk zeichnet sich durch ihre kühnen Schwarz-Weiß-Illustrationen und ihre offene Erzählweise aus und bietet berührende Einblicke in die iranische Gesellschaft und Politik. Ihre vielgelobte Filmadaption von \"Persepolis\" erhielt weitreichendes Lob und zahlreiche Auszeichnungen. Satrapi setzt sich weiterhin für die Schaffung nachdenklicher Kunst ein, die Themen wie Identität, Unterdrückung und Widerstand erkundet, und wird damit zu einer prominenten Stimme in der zeitgenössischen Literatur und im Kino.', 'marjan-satrapi.jpg', 3, 16),
(74, 'مرجان ساتراپی، متولد ۲۲ نوامبر ۱۹۶۹، نویسنده و نقاش کمیک و کارگردان ایرانی-فرانسوی است. او بیشتر بخاطر کتاب‌های کمیک خود به نام \"پرسپولیس\" شناخته می‌شود که دوران کودکی و جوانی او در ایران در طول و بعد از انقلاب اسلامی را به تصویر می‌کشند. کار مرجان با نقاشی‌های سیاه و سفید جسورانه و داستان‌گویی صادقانه و شفاف آشنا است و بینش‌های تاثیرگذاری از جامعه و سیاست ایران ارائه می‌دهد. فیلم اقتباسی از \"پرسپولیس\" او که به نام \"پرسپولیس\" است نیز توجه و تقدیر بسیاری را به دنبال داشته است. مرجان همچنان در حال ایجاد هنری است که موضوعاتی همچون هویت، ستم‌شناسی و اراده مقاومت را بررسی می‌کند و او را به یک صدای برجسته در ادبیات و سینمای معاصر تبدیل کرده است.', 'marjan-satrapi.jpg', 4, 16),
(75, '马尔贾娜·萨特拉皮，生于1969年11月22日，是一位伊朗裔法国人的图像小说家、插画家和电影导演。她以自传体的图像小说《波斯波利斯》而闻名，描述了伊朗伊斯兰革命期间和之后她的童年和早年。萨特拉皮的作品以大胆的黑白插图和坦率的叙述著称，深刻洞察了伊朗社会和政治。她备受好评的《波斯波利斯》电影改编获得了广泛赞誉和多项奖项。萨特拉皮继续创作引人深思的艺术作品，探索身份、压迫和韧性等主题，成为当代文学和电影中的重要声音。', 'marjan-satrapi.jpg', 6, 16),
(76, 'Reza Deghati, connu professionnellement sous le nom de Reza, est un photojournaliste irano-français de renom, né en 1952. Réputé pour ses images puissantes et évocatrices, Reza a couvert des conflits, des révolutions et des crises humanitaires dans le monde entier. Il a collaboré avec des publications prestigieuses telles que National Geographic et Time, capturant le côté humain des événements mondiaux avec empathie et sensibilité. Reza est également un fervent défenseur de la justice sociale et a mis en place des programmes éducatifs.', 'reza-deghati.jpg', 1, 17),
(77, 'Reza Deghati, known professionally as Reza, is an acclaimed Iranian-French photojournalist born in 1952. Renowned for his powerful and evocative images, Reza has covered conflicts, revolutions, and humanitarian crises worldwide. He has worked with prestigious publications like National Geographic and Time, capturing the human side of global events with empathy and sensitivity. Reza is also a passionate advocate for social justice and has established educational programs and foundations to empower marginalized communities through photography. His work has earned him numerous awards and honors, including the Chevalier of the National Order of Merit in France. Reza\'s photographs continue to inspire and provoke thought on pressing social issues.', 'reza-deghati.jpg', 2, 17),
(78, 'Reza Deghati, bekannt professionell als Reza, ist ein renommierter iranisch-französischer Fotojournalist, geboren 1952. Bekannt für seine kraftvollen und eindrucksvollen Bilder, hat Reza Konflikte, Revolutionen und humanitäre Krisen weltweit dokumentiert. Er hat mit renommierten Publikationen wie National Geographic und Time zusammengearbeitet und die menschliche Seite globaler Ereignisse mit Empathie und Sensibilität eingefangen. Reza ist auch ein leidenschaftlicher Verfechter sozialer Gerechtigkeit und hat Bildungsprogramme und Stiftungen gegründet, um marginalisierte Gemeinschaften durch Fotografie zu stärken. Seine Arbeit hat ihm zahlreiche Auszeichnungen und Ehrungen eingebracht, darunter den Ritter des Nationalen Verdienstordens in Frankreich. Rezas Fotografien inspirieren weiterhin und regen zum Nachdenken über drängende soziale Themen an.', 'reza-deghati.jpg', 3, 17),
(79, 'رضا دقتی، شهرت دار خود را با نام حرفه‌ای «رضا»، یک عکاس خبری و فیلم‌بردار ایرانی-فرانسوی است که در سال ۱۹۵۲ متولد شد. معروف به دلیل تصاویر قدرتمند و تحریک‌کننده‌اش، رضا درگیری‌ها، انقلاب‌ها و بحران‌های انسانی در سراسر جهان را پوشش داده است. او با نشریات معتبری مانند نشنال ژئوگرافی  و تایمز همکاری کرده است و طرف انسانی رویدادهای جهانی را با همدردی و حساسیت ثبت کرده است. رضا همچنین طرفدار پرقدرتی از عدالت اجتماعی است و برنامه‌های آموزشی و بنیادهایی را برای تقویت جوامع محروم از طریق عکاسی ایجاد کرده است. کار او به او جوایز و افتخارات بسیاری را از جمله فرانسه نشان نظام ملی فرانسه به او رسانده است. عکس‌های رضا همچنان انسان‌ها را الهام می‌دهد و به آنها در تفکر درباره مسائل اجتماعی فوری کمک می‌کند.', 'reza-deghati.jpg', 4, 17),
(80, 'Reza Deghati，以Reza的名字为人所熟知，是一位著名的伊朗裔法国摄影记者，出生于1952年。以其强大而引人入胜的图像而闻名，Reza报道了世界各地的冲突、革命和人道主义危机。他曾与《国家地理》和《时代》等知名出版物合作，以同情心和敏感度捕捉了全球事件的人性一面。Reza还是社会正义的热情倡导者，建立了教育项目和基金会，通过摄影来赋予边缘化社区力量。他的工作使他获得了许多奖项和荣誉，包括法国国家功勋骑士勋章。Reza的照片继续激励着人们思考当今重要的社会问题。', 'reza-deghati.jpg', 6, 17),
(81, 'Kaveh Golestan (1950 - 2003) était un photojournaliste et photographe documentaire iranien connu pour ses images puissantes capturant les réalités sociales et politiques de l\'Iran. Sa photographie emblématique d\'une mère kurde pleurant son enfant mort pendant la guerre Iran-Irak est devenue le symbole du coût humain du conflit. Le travail de Golestan s\'est également concentré sur la documentation de la vie des communautés marginalisées, y compris les enfants des rues et les réfugiés. Il s\'est engagé à représenter la vérité avec intégrité et compassion. Tragiquement, Golestan a perdu la vie lors d\'une mission en Irak, laissant derrière lui un héritage profond de narration visuelle qui continue de résonner à l\'échelle mondiale.', 'kave-golestan.jpg', 1, 18);
INSERT INTO `bio_artist` (`Id_bio`, `description_artist`, `chemin_Imgart`, `Id_Langue`, `Id_Artiste`) VALUES
(82, 'Kaveh Golestan (1950 – 2003) was an Iranian photojournalist and documentary photographer known for his powerful images capturing the social and political realities of Iran. His iconic photograph of a Kurdish mother grieving over the body of her dead child during the Iran-Iraq War became emblematic of the human toll of conflict. Golestan\'s work also focused on documenting the lives of marginalized communities, including street children and refugees. He was committed to portraying the truth with integrity and compassion. Tragically, Golestan lost his life while on assignment in Iraq, leaving behind a profound legacy of visual storytelling that continues to resonate globally.', 'kave-golestan.jpg', 2, 18),
(83, 'Kaveh Golestan (1950 - 2003) war ein iranischer Fotojournalist und Dokumentarfotograf, der für seine kraftvollen Bilder bekannt war, die die sozialen und politischen Realitäten des Iran einfangen. Sein ikonisches Foto einer kurdischen Mutter, die um das Leben ihres toten Kindes während des Iran-Irak-Krieges trauert, wurde zum Symbol für die menschlichen Kosten des Konflikts. Golestans Arbeit konzentrierte sich auch darauf, das Leben marginalisierter Gemeinschaften, einschließlich Straßenkindern und Flüchtlingen, zu dokumentieren. Er war entschlossen, die Wahrheit mit Integrität und Mitgefühl darzustellen. Tragischerweise verlor Golestan sein Leben bei einer Mission im Irak und hinterließ ein tiefgreifendes Erbe visueller Erzählungen, das weltweit weiterhin nachhallt.', 'kave-golestan.jpg', 3, 18),
(84, 'کاوه گلستان (۱۹۵۰ - ۲۰۰۳) عکاس خبری و عکاس مستند ایرانی بود که برای تصاویر قدرتمندش از واقعیت‌های اجتماعی و سیاسی ایران شناخته می‌شود. عکس نمادین او از یک مادر کردی که بر تن پسر فوت شده‌اش گریه می‌کند در طول جنگ ایران و عراق، نمادی از هزینه انسانی درگیری شد. کار گلستان همچنین بر روی ثبت زندگی جوامع محروم تمرکز داشت، از جمله کودکان خیابانی و پناهندگان. او متعهد بود که با اخلاق و همدلی حقیقت را به تصویر بکشد. متاسفانه، گلستان در حین انجام ماموریت در عراق جان خود را از دست داد و یک ارث ژرف از روایت‌های تصویری را که همچنان در سطح جهانی اثر می‌گذارد، به جا گذاشت.', 'kave-golestan.jpg', 4, 18),
(85, '加韦·戈莱斯坦（1950年 - 2003年）是一位伊朗摄影记者和纪录片摄影师，以其捕捉伊朗社会和政治现实的强大图像而闻名。他在伊朗-伊拉克战争期间拍摄的一张库尔德母亲在死去的孩子尸体旁哀悼的标志性照片成为了冲突造成的人类牺牲的象征。戈莱斯坦的工作还专注于记录边缘社区的生活，包括流浪儿童和难民。他致力于以诚实和同情心描绘真相。不幸的是，戈莱斯坦在伊拉克执行任务时丧生，留下了一个在全球范围内持续引人注目的视觉叙事的深远遗产。', 'kave-golestan.jpg', 6, 18),
(86, 'Guity Novin, née Navran le 21 avril 1944 à Kermanshah en Iran, est un peintre iranienne.Elle étudie l’art au collège pour filles de Téhéran et reçoit son diplôme en 1965. En 1970 elle est admise à la Faculté des Arts Décoratifs, et ses études terminées, elle épouse un économiste, Farid Novin avec qui elle aura trois fils. Elle travaille comme graphiste pour le ministère de la Culture, mais en tant que femme dans un milieu conservateur, son travail n’est jamais choisi. Elle décide de créer ses propres affiches, et c’est le succès. Elle a sa première exposition en 1971.\nEn 1975 elle s’installe en Hollande et un an plus tard en Angleterre. En 1980, nouveau départ pour Kingston en Ontario, puis Ottawa en 1983 où elle travaille et expose jusqu’en 1997. En 1994 elle fonde le mouvement Transpressionnisme en opposition à l’art Post-modern qui clamait arrivée la fin de la peinture.\n', 'guity-novin.jpg', 1, 19),
(87, 'Guity Novin (née Navran; born 1944) is an Iranian-born Canadian artist, known as a figurative painter and graphic designer. She classifies her work as \"transpressionism\" (trans- and impressionism), a term coined by Novin in the 1990s.[1] Her works are in private and public collections worldwide.[2] Novin has served on a UNESCO national committee of artists', 'guity-novin.jpg', 2, 19),
(88, 'Guity Novin, geborene Navran (geboren 1944), ist eine iranisch-kanadische Künstlerin, die als figürliche Malerin und Grafikdesignerin bekannt ist. Sie bezeichnet ihre Arbeit als \"Transpressionismus\" (Trans- und Impressionismus), ein Begriff, den Novin in den 1990er Jahren prägte.[1] Ihre Werke befinden sich in privaten und öffentlichen Sammlungen weltweit.[2] Novin war Mitglied eines nationalen Künstlerkomitees der UNESCO.', 'guity-novin.jpg', 3, 19),
(89, '\nگیتی نوین نگارگر، تندیسگر، گرافیست ایرانی ساکن کانادا و بنیان‌گذار جنبش هنری فَرااِنگاشت  است.  گیتی نوین در سال ۱۳۵۳ برای ادامه پژوهش هنری و برپایی نمایشگاه، نخست به هلند و سپس به بریتانیا رفت و از سال ۱۳۷۷ تاکنون در ونکوور کانادا زندگی می‌کند. پرده‌های نقاشی گیتی نوین در کلکسیون‌های عمومی و خصوصی اروپا، آمریکا، آسیا و استرالیا ارجمند شناخته می‌شوند.\n', 'guity-novin.jpg', 4, 19),
(90, '吉蒂·诺温（原名纳夫兰，生于 1944 年），是一位伊朗裔加拿大艺术家，以具象画家和平面设计师的身份闻名。她将自己的作品归类为“跨表现主义”（跨越性印象主义），这是一个诺温在 1990 年代创造的术语。[1] 她的作品被收藏于世界各地的私人和公共收藏中。[2] 诺温曾是联合国教科文组织国家艺术家委员会的成员。', 'guity-novin.jpg', 6, 19),
(91, 'Annette Messager (née le 30 novembre 1943) est une artiste contemporaine française connue pour sa diversité de travaux comprenant la photographie, la sculpture, l\'installation et les médias mixtes. Son art explore souvent les thèmes de la féminité, de l\'identité et du corps humain, remettant en question les normes et conventions sociales. L\'utilisation par Messager d\'objets et de matériaux du quotidien, ainsi que ses images provocantes et stimulantes, lui ont valu une reconnaissance internationale. Elle a représenté la France à la Biennale de Venise en 2005 et a reçu le Lion d\'or pour l\'ensemble de sa carrière. Tout au long de sa carrière, Messager a continué à repousser les limites artistiques, laissant une empreinte significative sur le monde de l\'art contemporain.', 'annette-messager.jpg', 1, 20),
(92, 'Annette Messager (born November 30, 1943) is a French contemporary artist known for her diverse body of work encompassing photography, sculpture, installation, and mixed media. Her art often explores themes of femininity, identity, and the human body, challenging societal norms and conventions. Messager\'s use of everyday objects and materials, along with her provocative and thought-provoking imagery, has earned her international acclaim. She represented France at the Venice Biennale in 2005 and was awarded the Golden Lion for Lifetime Achievement. Throughout her career, Messager has continued to push artistic boundaries, leaving a significant impact on the contemporary art world.', 'annette-messager.jpg', 2, 20),
(93, 'Annette Messager (geboren am 30. November 1943) ist eine französische zeitgenössische Künstlerin, bekannt für ihre vielfältigen Werke, die Fotografie, Skulptur, Installation und Mixed Media umfassen. Ihre Kunst erforscht oft Themen wie Weiblichkeit, Identität und den menschlichen Körper und stellt gesellschaftliche Normen und Konventionen in Frage. Messagers Verwendung von Alltagsgegenständen und Materialien sowie ihre provokativen und zum Nachdenken anregenden Bilder haben ihr internationale Anerkennung eingebracht. Sie vertrat Frankreich auf der Biennale von Venedig 2005 und wurde mit dem Goldenen Löwen für ihr Lebenswerk ausgezeichnet. Im Laufe ihrer Karriere hat Messager weiterhin künstlerische Grenzen ausgelotet und einen bedeutenden Einfluss auf die zeitgenössische Kunstwelt hinterlassen.', 'annette-messager.jpg', 3, 20),
(94, 'انت مساژه (متولد ۳۰ نوامبر ۱۹۴۳) هنرمند معاصر فرانسوی است که بخاطر مجموعه متنوعی از اعمال خود که شامل عکاسی، مجسمه‌سازی، نصب و رسانه‌های مختلط می‌شود شناخته می‌شود. هنر او اغلب موضوعاتی از جمله زنانگی، هویت و بدن انسان را کاوش می‌کند و باورها و معمولات جامعه را چالش می‌دهد. استفاده از اشیاء و مواد روزمره توسط مساژه، به همراه تصاویر تحریک‌کننده و مفکرانه‌اش، به او شهرت بین‌المللی بخشیده‌اند. او فرانسه را در نمایشگاه بین‌المللی ونیز سال ۲۰۰۵ نمایندگی کرد و مدال شیر طلایی برای عمر کاری دریافت کرد. در طول حرفه‌اش، مساژه به بررسی مرزهای هنری ادامه داده و تأثیر قابل توجهی بر جهان هنر معاصر گذاشته است.', 'annette-messager.jpg', 4, 20),
(95, '安妮特·梅萨日（Annette Messager，1943年11月30日出生）是一位法国当代艺术家，以她涵盖摄影、雕塑、装置艺术和混合媒体的多样化作品而闻名。她的艺术常常探索女性气质、身份和人体主题，挑战社会规范和传统。梅萨日使用日常物品和材料，以及她具有挑衅性和发人深省的形象，赢得了国际赞誉。她代表法国参加了2005年的威尼斯双年展，并荣获终身成就金狮奖。在她的职业生涯中，梅萨日继续突破艺术界的界限，对当代艺术界产生了重大影响。', 'annette-messager.jpg', 6, 20),
(96, 'Yayoi Kusama (née le 22 mars 1929) est une artiste contemporaine japonaise connue pour son travail avant-gardiste dans divers médiums, notamment la peinture, la sculpture, l\'installation et l\'art performance. Son style distinctif comprend souvent des motifs répétitifs, des pois et des couleurs psychédéliques. L\'art de Kusama est profondément influencé par ses expériences avec la maladie mentale et l\'obsession, qu\'elle canalise dans ses créations comme une forme de thérapie et d\'expression de soi. Elle a acquis une reconnaissance internationale dans les années 1960 pour ses happenings avant-gardistes et ses installations à New York. Aujourd\'hui, Kusama est célébrée comme l\'une des artistes les plus influentes des 20e et 21e siècles, ses œuvres étant exposées dans des musées et galeries prestigieux du monde entier.', 'yayoi-kusama.jpg', 1, 21),
(97, 'Yayoi Kusama (born March 22, 1929) is a Japanese contemporary artist known for her avant-garde work in various mediums, including painting, sculpture, installation, and performance art. Her distinctive style often features repetitive patterns, polka dots, and psychedelic colors. Kusama\'s art is deeply influenced by her experiences with mental illness and obsession, which she channels into her creations as a form of therapy and self-expression. She gained international recognition in the 1960s for her avant-garde happenings and installations in New York City. Today, Kusama is celebrated as one of the most influential artists of the 20th and 21st centuries, with her works displayed in prestigious museums and galleries worldwide.', 'yayoi-kusama.jpg', 2, 21),
(98, 'Yayoi Kusama (geboren am 22. März 1929) ist eine japanische zeitgenössische Künstlerin, bekannt für ihre avantgardistische Arbeit in verschiedenen Medien, darunter Malerei, Skulptur, Installation und Performance-Kunst. Ihr unverwechselbarer Stil zeichnet sich oft durch repetitive Muster, Polka Dots und psychedelische Farben aus. Kusamas Kunst ist tief von ihren Erfahrungen mit psychischen Erkrankungen und Obsessionen geprägt, die sie in ihren Kreationen als Form der Therapie und Selbstausdruck kanalisiert. Sie erlangte in den 1960er Jahren internationale Anerkennung für ihre avantgardistischen Ereignisse und Installationen in New York City. Heute wird Kusama als eine der einflussreichsten Künstlerinnen des 20. und 21. Jahrhunderts gefeiert, ihre Werke werden in renommierten Museen und Galerien weltweit ausgestellt.', 'yayoi-kusama.jpg', 3, 21),
(99, 'یایوی کوساما (متولد ۲۲ مارس ۱۹۲۹) هنرمند معاصر ژاپنی است که بخاطر کارهای پیشرو در انواع مختلف از جمله نقاشی، مجسمه‌سازی، نصب و اجرای هنر شناخته می‌شود. سبک خاص او اغلب شامل الگوها، نقاط پلکا و رنگ‌های سایکدلیک است. هنر کوساما به شدت تحت تأثیر تجربیاتش با بیماری‌های روانی و وسواس است که او این تجربیات را به عنوان یک نوع درمان و خودبیان‌سازی در آثارش به کار می‌برد. او در دهه ۱۹۶۰ به خاطر فعالیت‌های پیشرو و نصب‌هایش در شهر نیویورک شناخته شد. امروزه، کوساما به عنوان یکی از معروفترین هنرمندان قرن بیستم و بیست و یکم شناخته می‌شود و آثارش در موزه‌ها و گالری‌های معتبر جهان به نمایش گذاشته می‌شود.', 'yayoi-kusama.jpg', 4, 21),
(100, '草间弥生（生于1929年3月22日）是一位日本当代艺术家，以在各种媒介中的前卫作品而闻名，包括绘画、雕塑、装置艺术和表演艺术。她独特的风格常常包括重复的图案、圆点和迷幻色彩。草间的艺术深受她与精神疾病和执念的经历影响，她将这些经历转化为创作中的一种疗法和自我表达形式。她在1960年代因在纽约市的前卫事件和装置艺术而获得国际认可。如今，草间被誉为20世纪和21世纪最具影响力的艺术家之一，她的作品在世界各地的著名博物馆和画廊展出。', 'yayoi-kusama.jpg', 6, 21),
(101, 'Bahman Mohassess (1er mars 1931 à Rasht - 28 juillet 2010 à Rome) était un peintre, sculpteur et traducteur iranien avant-gardiste et influent. Il a été l\'un des premiers peintres iraniens à apprendre la peinture à l\'occidentale et à la mélanger avec une perspective orientale. Beaucoup le considèrent comme influencé par Picasso, et certains l\'appellent même le Picasso iranien ; un artiste dont les œuvres, bien qu\'utilisant des techniques et des perspectives occidentales, possèdent indéniablement un esprit iranien. Les peintures avant-gardistes de Bahman Mohassess sont considérées comme l\'une des œuvres les plus importantes de la peinture iranienne moderne.\nDans un sondage de Nowruz 1394 réalisé par le trimestriel professionnel Honarmand, qui a été réalisé auprès de 100 artistes et critiques d\'art pour sélectionner les dix artistes modernistes iraniens les plus distingués, Mohassess a été classé en tête de liste des artistes modernistes iraniens des années 1920 à nos jours.\n', 'bahman-mohasses.jpg', 1, 22),
(102, 'Bahman Mohassess (March 1, 1931 in Rasht – July 28, 2010 in Rome) was a pioneering and influential Iranian painter, sculptor, and translator. He was among the first Iranian painters to learn painting in the Western style and blend it with an Eastern perspective. Many consider him to be influenced by Picasso, and some even call him the Iranian Picasso; an artist whose works, despite using Western techniques and perspectives, undeniably possess an Iranian spirit. Bahman Mohassess\'s avant-garde paintings are considered to be among the most important works of modern Iranian painting.\nIn a Nowruz 1394 poll by the professional quarterly Honarmand, which was conducted among 100 artists and art critics to select the ten most distinguished Iranian modernist artists, Mohassess was ranked at the top of the list of Iranian modernist artists from the 1920s to the present.\n', 'bahman-mohasses.jpg', 2, 22),
(103, 'Bahman Mohassess (1. März 1931 in Rasht – 28. Juli 2010 in Rom) war ein bahnbrechender und einflussreicher iranischer Maler, Bildhauer und Übersetzer. Er gehörte zu den ersten iranischen Malern, die die Malerei im westlichen Stil erlernten und sie mit einer östlichen Perspektive verbanden. Viele betrachten ihn als von Picasso beeinflusst, und einige nennen ihn sogar den iranischen Picasso; ein Künstler, dessen Werke trotz der Verwendung westlicher Techniken und Perspektiven unbestreitbar einen iranischen Geist besitzen. Die avantgardistischen Gemälde von Bahman Mohassess gelten als einige der wichtigsten Werke der modernen iranischen Malerei.\nIn einer Nowruz-Umfrage 1394 der Fachzeitschrift Honarmand, die unter 100 Künstlern und Kunstkritikern durchgeführt wurde, um die zehn bedeutendsten iranischen Modernisten zu wählen, stand Mohassess an der Spitze der Liste der iranischen Modernisten von den 1920er Jahren bis heute.\n', 'bahman-mohasses.jpg', 3, 22),
(104, 'بهمن محصص (۱۰ اسفند ۱۳۰۹ در رشت – ۶ مرداد ۱۳۸۹ در رم) نقاش، مجسمه‌ساز و مترجم پیشرو و جریان‌ساز ایرانی بود. او جزو نخستین نقاشان ایرانی بود که نقاشی را به شیوه غربی آموخت و آن را با نگاهی شرقی آمیخت. بسیاری او را تحت تاثیر پیکاسو می‌دانند و برخی حتی او را پیکاسوی ایرانی می‌نامند؛ هنرمندی که با وجود استفاده از تکنیک‌ها و نگاه‌های غربی در آثارش، وجود روح ایرانی در کارهایش انکارناپذیر است. نقاشی‌های آوانگارد بهمن محصص از آثار معتبر نقاشی مدرن ایران محسوب می‌شود.\nمحصص در نظرسنجی نوروز سال ۹۴ فصلنامهٔ حرفه: هنرمند برای انتخاب ده هنرمند برگزیده هنر نوگرای ایران که بین صد هنرمند و هنرشناس انجام شد، در صدر فهرست هنرمندان نوگرای ایران از دههٔ بیست تا به امروز قرار گرفت.\n', 'bahman-mohasses.jpg', 4, 22),
(105, '巴赫曼·莫哈塞斯（1931 年 3 月 1 日出生于拉什特，2010 年 7 月 28 日卒于罗马）是一位开创性且有影响力的伊朗画家、雕塑家和翻译家。他是最早学习西方绘画风格并将其与东方视角相融合的伊朗画家之一。许多人认为他受到毕加索的影响，有些人甚至称他为伊朗的毕加索；一位艺术家，他的作品尽管使用了西方技术和视角，但不可否认地具有伊朗精神。巴赫曼·莫哈塞斯的先锋派绘画被认为是现代伊朗绘画最重要的作品之一。\n在 1394 年 Nowruz 由专业季刊 Honarmand 进行的一项调查中，该调查在 100 名艺术家和艺术评论家之间进行，以选出十位最杰出的伊朗现代主义艺术家，莫哈塞斯在 20 年代至现在的伊朗现代主义艺术家名单中排名第一。\n', 'bahman-mohasses.jpg', 6, 22),
(106, 'Santiago Sierra (Madrid, 1966) est un artiste contemporain espagnol. Il est connu pour utiliser l\'installation, la performance et la photographie comme moyens artistiques. Ses œuvres d\'art sont à contenu critique et politique.', 'santiago-sierra.jpg', 1, 23),
(107, 'Santiago Sierra (Madrid, 1966) is a Spanish contemporary artist. He is known for using installation, performance, and photography as artistic media. His artworks are of critical and political content.', 'santiago-sierra.jpg', 2, 23),
(108, 'Santiago Sierra (Madrid, 1966) ist ein spanischer zeitgenössischer Künstler. Er ist bekannt für die Verwendung von Installation, Performance und Fotografie als künstlerische Medien. Seine Kunstwerke sind von kritischem und politischem Inhalt.', 'santiago-sierra.jpg', 3, 23),
(109, 'سانتیاگو سیرا (مادرید، 1966) یک هنرمند معاصر اسپانیایی است. او به خاطر استفاده از چیدمان، اجرا و عکاسی به عنوان رسانه هنری شناخته شده است. آثار هنری او محتوای انتقادی و سیاسی دارند.', 'santiago-sierra.jpg', 4, 23),
(110, '圣地亚哥·塞拉 (马德里，1966 年) 是一位西班牙当代艺术家。他以使用装置、行为艺术和摄影作为艺术媒介而闻名。他的艺术作品具有批判性和政治性。', 'santiago-sierra.jpg', 6, 23),
(111, 'Pierre Soulages (né le 24 décembre 1919) est un peintre et sculpteur français de renom, connu pour ses œuvres abstraites et monochromatiques. Né à Rodez, en France, Soulages est célèbre pour son utilisation novatrice de la peinture noire et pour son exploration de la lumière et de la texture. Sa série \"Outrenoir\", caractérisée par des couches épaisses de peinture noire qui réfléchissent et absorbent la lumière, a été acclamée dans le monde entier. La carrière artistique de Soulages s\'étend sur plus de huit décennies, au cours desquelles il a reçu de nombreux prix et distinctions, dont le Grand Prix National de Peinture en France. Ses œuvres se trouvent dans les plus grands musées et collections du monde entier.', 'pierre-soulages.jpg', 1, 24),
(112, 'Pierre Soulages (born December 24, 1919) is a renowned French painter and sculptor known for his abstract and monochromatic works. Born in Rodez, France, Soulages is celebrated for his innovative use of black paint and for his exploration of light and texture. His \"Outrenoir\" (Beyond Black) series, characterized by thick layers of black paint that reflect and absorb light, has garnered international acclaim. Soulages\' artistic career spans over eight decades, during which he has received numerous awards and honors, including the Grand Prix National de Peinture in France. His works can be found in major museums and collections worldwide.', 'pierre-soulages.jpg', 2, 24),
(113, 'Pierre Soulages (geboren am 24. Dezember 1919) ist ein renommierter französischer Maler und Bildhauer, bekannt für seine abstrakten und monochromen Werke. Geboren in Rodez, Frankreich, wird Soulages für seinen innovativen Einsatz von schwarzer Farbe und seine Erforschung von Licht und Textur gefeiert. Seine Serie \"Outrenoir\" (Jenseits von Schwarz), gekennzeichnet durch dicke Schichten schwarzer Farbe, die Licht reflektieren und absorbieren, hat internationale Anerkennung gefunden. Soulages\' künstlerische Karriere erstreckt sich über mehr als acht Jahrzehnte, in denen er zahlreiche Auszeichnungen und Ehrungen erhalten hat, darunter den Grand Prix National de Peinture in Frankreich. Seine Werke sind in bedeutenden Museen und Sammlungen weltweit zu finden.', 'pierre-soulages.jpg', 3, 24),
(114, 'پیر سولاژ (متولد ۲۴ دسامبر ۱۹۱۹) یک نقاش و مجسمه‌ساز فرانسوی معروف است که بخاطر آثار انتزاعی و تک رنگ خود شناخته می‌شود. سولاژ در رودز، فرانسه متولد شد و بخاطر استفاده نوآورانه از رنگ سیاه و بررسی نور و بافت شناخته شده است. سری \"آوتروار\" (فراتر از سیاه) وی، که به لایه‌های ضخیم رنگ سیاه معروف است که نور را منعکس و جذب می‌کند، شهرت بین‌المللی دارد. زندگینامه هنری سولاژ بیش از هشت دهه است که در طی آن او مقامات و جوایز بسیاری از جمله جایزه ملی نقاشی فرانسه را دریافت کرده است. آثار وی در موزه‌ها و مجموعه‌های معتبری در سراسر جهان قابل دسترسی است.', 'pierre-soulages.jpg', 4, 24),
(115, '皮埃尔·苏拉奇（Pierre Soulages，1919年12月24日出生）是一位著名的法国画家和雕塑家，以其抽象和单色作品而闻名。苏拉奇出生在法国罗德兹，以其对黑色油漆的创新使用以及对光线和纹理的探索而备受赞誉。他的“Outrenoir”（超越黑色）系列以厚重的黑色油漆层为特色，能够反射和吸收光线，赢得了国际赞誉。苏拉奇的艺术生涯跨越了八十多年，期间他获得了许多奖项和荣誉，包括法国的国家绘画大奖。他的作品可以在世界各地的主要博物馆和收藏中找到', 'pierre-soulages.jpg', 6, 24),
(116, 'Robert Morris (né le 9 février 1931) est un sculpteur, artiste conceptuel et écrivain américain. Il a joué un rôle pivot dans le développement du minimalisme et de l\'art du paysage dans les années 1960 et 1970. Les sculptures de Morris, souvent de grande taille et fabriquées à partir de matériaux industriels, explorent la relation entre l\'art, l\'espace et la perception du spectateur. Son travail aborde également les thèmes du pouvoir, de l\'identité et du corps. Au-delà de sa pratique artistique, Morris a contribué de manière significative à la théorie de l\'art grâce à ses écrits, qui ont influencé des générations d\'artistes. Il continue d\'être célébré pour ses contributions novatrices à l\'art contemporain.', 'robert-maurice.jpg', 1, 25),
(117, 'Robert Morris (born February 9, 1931) is an American sculptor, conceptual artist, and writer. He played a pivotal role in the development of Minimalism and Land Art in the 1960s and 1970s. Morris\' sculptures, often large-scale and made from industrial materials, explore the relationship between art, space, and the viewer\'s perception. His work also delves into themes of power, identity, and the body. Beyond his artistic practice, Morris has contributed significantly to art theory through his writings, which have influenced generations of artists. He continues to be celebrated for his groundbreaking contributions to contemporary art.', 'robert-maurice.jpg', 2, 25),
(118, 'Robert Morris (geboren am 9. Februar 1931) ist ein amerikanischer Bildhauer, Konzeptkünstler und Schriftsteller. Er spielte eine entscheidende Rolle in der Entwicklung des Minimalismus und der Land Art in den 1960er und 1970er Jahren. Morris\' Skulpturen, oft großformatig und aus industriellen Materialien gefertigt, erforschen die Beziehung zwischen Kunst, Raum und der Wahrnehmung des Betrachters. Seine Arbeit beschäftigt sich auch mit Themen wie Macht, Identität und dem Körper. Neben seiner künstlerischen Praxis hat Morris durch seine Schriften maßgeblich zur Kunsttheorie beigetragen, die Generationen von Künstlern beeinflusst haben. Er wird weiterhin für seine bahnbrechenden Beiträge zur zeitgenössischen Kunst gefeiert.', 'robert-maurice.jpg', 3, 25),
(119, 'رابرت موریس (متولد ۹ فوریه ۱۹۳۱) یک مجسمه‌ساز، هنرمند مفهومی و نویسنده آمریکایی است. وی نقش کلیدی در توسعه کمینه‌گرایی و هنر زمین در دهه‌های ۱۹۶۰ و ۱۹۷۰ ایفا کرده است. مجسمه‌های موریس، اغلب به ابعاد بزرگ و از مواد صنعتی ساخته شده، رابطه بین هنر، فضا و درک بیننده را بررسی می‌کنند. کار وی همچنین به موضوعاتی از قدرت، هویت و بدن می‌پردازد. علاوه بر ممارسه هنری خود، موریس از طریق نوشته‌هایش به نظریه هنر به‌طور قابل توجهی کمک کرده است که تأثیرات بسیاری بر نسل‌های هنرمند داشته است. وی همچنان برای مشارکت‌های نوآورانه خود در هنر معاصر تجلیل می‌شود.', 'robert-maurice.jpg', 4, 25),
(120, '罗伯特·莫里斯（生于1931年2月9日）是美国雕塑家、概念艺术家和作家。他在20世纪60年代和70年代的极简主义和土地艺术发展中发挥了关键作用。莫里斯的雕塑作品常常是大尺寸的，使用工业材料制作，探索艺术、空间和观众感知之间的关系。他的作品还涉及权力、身份和身体等主题。除了他的艺术实践外，莫里斯通过他的著作在艺术理论方面做出了重要贡献，影响了一代又一代的艺术家。他因其对当代艺术的开创性贡献而继续受到赞誉。', 'robert-maurice.jpg', 6, 25),
(121, 'Ali Asghar Petgar (né en 1292 à Tabriz – décédé en 1371 à Téhéran) était un éminent peintre réaliste contemporain, disciple de Mir Emad ; de nombreux artistes contemporains étaient ses disciples. Petgar penchait initialement vers l\'impressionnisme mais plus tard, influencé par Mir Emad, son travail s\'est orienté vers les œuvres de Kamal-ol-Molk, Ismail Ashthiani et Ali Mohammad Heydarian.', 'ali-asghar-petgar.jpg', 1, 26),
(122, 'Ali Asghar Petgar (born in 1292 in Tabriz – died in 1371 in Tehran) was a prominent contemporary realist painter, a disciple of Mir Emad; many contemporary artists were his disciples. Petgar initially leaned towards impressionism but later, influenced by Mir Emad, his work inclined towards the works of Kamal-ol-Molk, Ismail Ashthiani, and Ali Mohammad Heydarian.', 'ali-asghar-petgar.jpg', 2, 26),
(123, 'Ali Asghar Petgar (geboren 1292 in Tabriz – gestorben 1371 in Teheran) war ein prominenter zeitgenössischer Realistmaler, ein Schüler von Mir Emad; viele zeitgenössische Künstler waren seine Schüler. Petgar neigte zunächst zum Impressionismus, wurde aber später durch Mir Emad beeinflusst und neigte in seinem Werk zu den Werken von Kamal-ol-Molk, Ismail Ashthiani und Ali Mohammad Heydarian.', 'ali-asghar-petgar.jpg', 3, 26),
(124, 'علی‌اصغر پِتگر (زادهٔ ۱۲۹۲ در تبریز – درگذشتهٔ ۱۳۷۱ در تهران) نقاش واقع‌گرای برجستهٔ معاصر، از شاگردان میرمصور بود؛ بسیاری از هنرمندان معاصر از شاگردان او بوده‌اند. پتگر در ابتدا به امپرسیونیسم گرایش داشت ولی متأثر از میرمصور در ادامه کارهایش به آثار کمال‌الملک، اسماعیل آشتیانی و علی‌محمد حیدریان متمایل شد.', 'ali-asghar-petgar.jpg', 4, 26),
(125, '阿里·阿斯加尔·佩特加尔（生于塔布里兹的1292年 - 1371年逝世于德黑兰）是一位杰出的当代现实主义画家，米尔埃马德的弟子；许多当代艺术家是他的弟子。佩特加尔最初倾向于印象派，但后来受米尔埃马德的影响，他的作品倾向于卡马尔-奥尔-莫克、伊斯梅尔·阿什蒂亚尼和阿里·穆罕默德·海达里安的作品。', 'ali-asghar-petgar.jpg', 6, 26),
(126, 'Jafar Petgar (né en Esfand 1299 à Tabriz – décédé le 25 Shahrivar 1384 à Téhéran) était un éminent designer de tapis contemporain et peintre, disciple de Mir Emad. Certaines de ses peintures les plus célèbres incluent \"Le vendeur de tapis\", \"Les marchands de tapis errants\", \"Le café Amirabad\", \"L\'école coranique\", \"La maison du peintre\", \"Le vendeur de poulets\", \"D\'ici à l\'éternité\" et \"Shahriar\", qui sont toutes conservées au Musée d\'art contemporain de Téhéran', 'jafar-petgar.jpg', 1, 27),
(127, 'Jafar Petgar (born Esfand 1299 in Tabriz – died 25 Shahrivar 1384 in Tehran) was a prominent contemporary carpet designer and painter, and a disciple of Mir Emad. Some of his most famous paintings include \"The Rug Seller,\" \"Wandering Carpet Sellers,\" \"Amirabad Café,\" \"Quran School,\" \"Painter\'s House,\" \"Chicken Seller,\" \"From Here to Eternity,\" and \"Shahriar,\" all of which are preserved in the Tehran Museum of Contemporary Art.', 'jafar-petgar.jpg', 2, 27),
(128, 'Jafar Petgar (geboren Esfand 1299 in Tabriz – gestorben 25 Shahrivar 1384 in Teheran) war ein herausragender zeitgenössischer Teppichdesigner und Maler und ein Schüler von Mir Emad. Zu seinen bekanntesten Gemälden gehören \"Der Teppichhändler\", \"Wandernde Teppichhändler\", \"Amirabad Café\", \"Koranschule\", \"Malerhaus\", \"Hühnerverkäufer\", \"Von hier bis in die Ewigkeit\" und \"Shahriar\", die alle im Museum für zeitgenössische Kunst Teheran aufbewahrt werden.\n', 'jafar-petgar.jpg', 3, 27),
(129, '\nجعفر پِتگر (زادهٔ اسفند ۱۲۹۹ در تبریز – درگذشتهٔ ۲۵ شهریور ۱۳۸۴در تهران) نگارگر فرش و نقاش برجستهٔ معاصر، از شاگردان میرمصور بود. از مشهورترین آثار نقاشی او می‌توان از «رفوگر»، «قالی فروشان دوره‌گرد»، «قهوه‌خانهٔ امیرآباد»، «مکتب قرآن»، «خانهٔ نقاش»، «مرغ فروش»، «از اینجا تا ابدیت» و «شهریار» یاد کرد، که در موزه هنرهای معاصر تهران نگهداری می‌شوند.\n', 'jafar-petgar.jpg', 4, 27),
(130, '贾法尔·佩特加尔（生于塔布里兹的1299年Esfand – 1384年的25 Shahrivar在德黑兰去世）是一位杰出的当代地毯设计师和画家，是米尔埃马德的弟子。他最著名的绘画作品包括“地毯商”、“徘徊的地毯商”、“Amirabad咖啡馆”、“古兰经学校”、“画家之家”、“售鸡者”、“从这里到永恒”和“沙赫利亚尔”，这些作品都被保存在德黑兰当代艺术博物馆中。', 'jafar-petgar.jpg', 6, 27);

-- --------------------------------------------------------

--
-- Structure de la table `collaborateur`
--

CREATE TABLE `collaborateur` (
  `id_Collaborateur` int(11) NOT NULL,
  `Nom_Collaborateur` varchar(80) NOT NULL,
  `prenom_Collaborateur` varchar(80) NOT NULL,
  `Email_Collaborateur` varchar(80) NOT NULL,
  `Pass_Collaborateur` varchar(30) NOT NULL,
  `Id_Service` int(11) NOT NULL,
  `roles` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `collaborateur`
--

INSERT INTO `collaborateur` (`id_Collaborateur`, `Nom_Collaborateur`, `prenom_Collaborateur`, `Email_Collaborateur`, `Pass_Collaborateur`, `Id_Service`, `roles`) VALUES
(1, 'Tavard', 'Jean pierre', 'jeanpierre.tavard@grandangle.fr', 'Jt2025&t', 1, '[\'ROLE_USER\',\'ROLE_ADMIN\']'),
(2, 'Lecourt', 'Victoria', 'victoria.lecourt@grandangle.fr', 'Vl2024!t', 2, '[\'USER\']'),
(3, 'Dubrac', 'Gabriel', 'gabriel.dubrac@grandangle.fr', 'Gd2023%t', 3, '[\'USER\']'),
(4, 'Loup', 'Julie', 'julie.loup@grandangle.fr', 'Jl2022&t', 4, '[’’USER’’]'),
(5, 'Bazin', 'Alya', 'alya.bazin@grandangle.fr', 'Ab2021!t', 4, '[’’USER’’]'),
(6, 'Dupond', 'Claire', 'claire.dupond@grandangle.fr', 'Cd2020%t', 4, '[’’USER’’]'),
(7, 'Martin', 'Anna', 'anna.martin@grandangle.fr', 'Am2019&t', 4, '[’’USER’’]'),
(8, 'Luciani', 'Clara', 'clara.luciani@grandangle.fr', 'Cl2018!t', 5, '[’’USER’’]'),
(9, 'Thomas', 'Nicolas', 'nicolas.thomass@grandangle.fr', 'Nt2017%t', 5, '[’’USER’’]'),
(10, 'Herve', 'Jean', 'jean.herve@grandangle.fr', 'Jh2016&t', 5, '[’’USER’’]'),
(11, 'Duval', 'Sarah', 'sarah.duval@grandangle.fr', 'Sd2015!t', 5, '[’’USER’’]'),
(12, 'Schneider', 'Alex', 'alex.schneider@grandangle.fr', 'As2014%t', 6, '[’’USER’’]'),
(13, 'Holmes', 'Sherlock', 'sherlock.holmes@grandangle.fr', 'Sh2013&t', 6, '[’’USER’’]'),
(14, 'Ahmadi', 'Shadi', 'ahmadi.shadi@grandangle.fr', 'As2012!t', 6, '[’’USER’’]'),
(15, 'Lee', 'Huan', 'huan.lee@grandangle.fr', 'Hl2011%t', 6, '[’’USER’’]'),
(16, 'Baron', 'Goli', 'goli.baron@grandangle.fr', 'Gb2010&t', 6, '[’’USER’’]'),
(17, 'Ming', 'Julie', 'julie.ming@grandangle.fr', 'Jm2009!t', 6, '[’’USER’’]'),
(18, 'Moulin', 'Jean', 'jean.moulin@grandangle.fr', 'Jm2009!t', 6, '[’’USER’’]'),
(19, 'Bachiri', 'Behzad', 'behzad.bachiri@grandangle.fr', 'Bb2008%t', 6, '[’’USER’’]'),
(20, 'Lopes', 'Valentin', 'valentin.lopes@grandangle.fr', 'Vl2007&t', 6, '[’’USER’’]'),
(21, 'Aubry', 'Sam', 'sam.aubry@grandangle.fr', 'Sa2006!t', 6, '[’’USER’’]'),
(22, 'Armani', 'Pari', 'pari.armani@grandangle.fr', 'Pa2005%t', 6, '[’’USER’’]'),
(23, 'Blanc', 'Mariam', 'mariam.blanc@grandangle.fr', 'Mb2004&t', 6, '[’’USER’’]'),
(24, 'Sharifi', 'Leila', 'leila.sharifi@grandangle.fr', 'Ls2003!t', 6, '[’’USER’’]'),
(25, 'Safavi', 'Mahsa', 'mahsa.safavi@grandangle.fr', 'Ms2002%t', 6, '[’’USER’’]'),
(26, 'Klein', 'Justine', 'justine.klein@grandangle.fr', 'Jk2001%t', 7, '[’’USER’’]'),
(27, 'Traore', 'Ousmane', 'ousmane.traore@grandangle.fr', 'Ot2000&t', 7, '[’’USER’’]'),
(28, 'Rosay', 'Biggie', 'biggie.rosay@grandangle.fr', 'Br1999!t', 7, '[’’USER’’]'),
(29, 'Sakharov', 'Helena', 'helena.sakharov@grandangle.fr', 'Hs1998%t', 7, '[’’USER’’]'),
(30, 'Gorbatchev', 'Vladimir', 'vladimir.gorbatchev@grandangle.fr', 'Vg1997&t', 7, '[’’USER’’]'),
(31, 'Potter', 'Rose', 'rose.potter@grandangle.fr', 'Rp1996!t', 7, '[’’USER’’]'),
(32, 'Macron', 'Thibault', 'thibault.macron@grandangle.fr', 'Tm1995M%t', 7, '[’’USER’’]');

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE `contenir` (
  `Id_Exposition` int(11) NOT NULL,
  `Id_Espace` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `contenu`
--

CREATE TABLE `contenu` (
  `id_Contenu` int(11) NOT NULL,
  `description_Contenu` text,
  `Auteur_Contenu` varchar(100) DEFAULT NULL,
  `libelle_contenu` varchar(100) DEFAULT NULL,
  `Id_oeuvre` int(11) NOT NULL,
  `Id_Langue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `contenu`
--

INSERT INTO `contenu` (`id_Contenu`, `description_Contenu`, `Auteur_Contenu`, `libelle_contenu`, `Id_oeuvre`, `Id_Langue`) VALUES
(1, 'Un mollah dans sa voiture, armé, le jour de la victoire lors de la Révolution. Il est accompagné d’autres d’autres combattants. Le regard vide, fixé sur l’objectif de l’appareil photo.', 'Shadi ahmadi', 'Mollah et révolution', 1, 1),
(2, 'A mullah in his car, armed, on the day of victory during the Revolution. He is accompanied by other fighters. His empty gaze fixed on the camera lens.', 'Sherlock Holmes', 'Mullah and revolution', 1, 2),
(3, 'Ein Mullah in seinem Auto, bewaffnet, am Tag des Sieges während der Revolution. Er wird von anderen Kämpfern begleitet. Sein leerer Blick ist auf das Objektiv der Kamera gerichtet.', 'Alex schneider', 'Mullah und Revolution', 1, 3),
(4, '\"ملا در اتومبیل خود، مسلح، در روز پیروزی  انقلاب. او توسط سایر نبردکاران همراه شده است. نگاه خالی او به دوربین متمرکز شده است.', 'Shadi ahmadi', 'ملا و انقلاب', 1, 4),
(5, '革命胜利之日，一名穿着武装的神职人员坐在汽车里。他被其他战士陪同着。他的眼神空洞，盯着相机的镜头。', 'Huan lee', '神职人员和革命', 1, 6),
(6, 'La crise des otages américains en Iran est un épisode de tension internationale dans les relations entre les États-Unis et l\'Iran, qui a lieu du 4 novembre 1979 au 20 janvier 1981. Pendant 444 jours, cinquante-deux diplomates et civils américains sont retenus en otage par des étudiants iraniens dans l\'ambassade des États-Unis à Téhéran. Image captée devant l’embassade des Etats-Unis. ', 'Shadi ahmadi', 'Ambassade des états-unis', 2, 1),
(7, 'The American hostage crisis in Iran is an episode of international tension in the relations between the United States and Iran, occurring from November 4, 1979, to January 20, 1981. For 444 days, fifty-two American diplomats and civilians were held hostage by Iranian students at the United States embassy in Tehran. Image captured in front of the US embassy.', 'Sherlock Holmes', 'USA Embassy', 2, 2),
(8, 'Die amerikanische Geiselnahme in Iran ist ein episodisches Ereignis der internationalen Spannung in den Beziehungen zwischen den Vereinigten Staaten und dem Iran, das vom 4. November 1979 bis zum 20. Januar 1981 stattfand. Für 444 Tage wurden zweiundfünfzig amerikanische Diplomaten und Zivilisten von iranischen Studenten in der US-Botschaft in Teheran als Geiseln gehalten. Bild aufgenommen vor der US-Botschaft.', 'Alex schneider', 'USA Botschaft', 2, 3),
(9, 'بحران گروگان‌گیری آمریکایی‌ها در ایران یک قسمت از تنش‌های بین‌المللی در روابط بین ایالات متحده و ایران بود، که از ۴ نوامبر ۱۹۷۹ تا ۲۰ ژانویه ۱۹۸۱ رخ داد. در طول ۴۴۴ روز، پنجاه و دو دیپلمات و شهروند آمریکایی توسط دانشجویان ایرانی در سفارت آمریکا در تهران به عنوان گروگان نگه داشته شدند. تصویر در مقابل سفارت ایالات متحده گرفته شده است.', 'Shadi ahmadi', 'سفارت ایالات متحده آمریکا', 2, 4),
(10, '伊朗的美国人质危机是美国和伊朗之间国际紧张关系的一个事件，发生在1979年11月4日至1981年1月20日。444天内，五十二名美国外交官和平民被伊朗学生在德黑兰的美国大使馆中扣为人质。图片是在美国大使馆前拍摄的。', 'Huan lee', '美国大使馆', 2, 6),
(11, 'Téhéran, 11 février 1979. Lors d\'une manifestation pro-Chah au stade Amjadiyeh, une partisane met un billet de banque à l\'effigie du Chah devant ses yeux en signe d\'allégeance.', 'Shadi ahmadi', 'allégeance', 3, 1),
(12, 'Iran, Tehran February 11th 1979. At a pro-Shah demonstration at the Amjadiyeh Stadium, a supporter puts a banknote with the Shah\'s portrait to her eye as a sign of allegiance.', 'Sherlock Holmes', 'Alligeance', 3, 2),
(13, 'Teheran, 11. Februar 1979. Bei einer pro-Schah-Demonstration im Amjadiyeh-Stadion legt eine Unterstützerin einen Geldschein mit dem Porträt des Schahs vor ihr Auge als Zeichen der Treue.', 'Alex schneider', 'Treue', 3, 3),
(14, 'تهران، ۱۱ فوریه ۱۹۷۹. در یک تظاهرات حمایت از شاه در ورزشگاه امجدیه، یک پشتیبان به عنوان نشانه وفاداری یک اسکناس با نقش شاه را جلوی چشمانش قرار می‌دهد.', 'Shadi ahmadi', 'وفاداری', 3, 4),
(15, '1979年2月11日，德黑兰。在Amjadiyeh体育场举行的一场亲沙阿的示威活动中，一名支持者将一张印有沙阿肖像的纸币放在眼前，表示忠诚。', 'Huan lee', '忠诚 ', 3, 6),
(16, 'Photo de Khomeiny qui a installé en Iran une théocratie chiite qu\'il gouverne depuis son établissement jusqu\'à sa mort en 1989, période durant laquelle il occupe le poste de Guide de la révolution. ', 'Shadi ahmadi', 'Khomeiny', 4, 1),
(17, 'Photo of Khomeini who established a Shiite theocracy in Iran, which he governed from its establishment until his death in 1989, during which he held the position of Supreme Leader of the Revolution.', 'Sherlock Holmes', 'Khomeiny', 4, 2),
(18, 'Foto von Khomeini, der im Iran eine schiitische Theokratie etabliert hat, die er von ihrer Gründung bis zu seinem Tod im Jahr 1989 regierte, während er die Position des Obersten Führers der Revolution innehatte.', 'Alex schneider', 'Khomeiny', 4, 3),
(19, 'عکس خمینی که حکومت مذهبی شیعی را در ایران برپا کرد و از زمان بنیانگذاری تا مرگش در سال ۱۹۸۹ ، در طی دوره‌ای که به عنوان رهبر انقلاب شغل داشت، از آن حکومت رهبری کرد.', 'Shadi ahmadi', 'Khomeiny', 4, 4),
(20, '有关鲁霍拉·霍梅尼的照片，他在伊朗建立了一个什叶派的神权政体，从成立到1989年去世期间统治该国，在此期间他担任革命的最高领袖一职。', 'Huan lee', 'Khomeiny', 4, 6),
(21, 'IRAN Téhéran 12 décembre 1977. L\'Iran célèbre la victoire de son armée sur les séparatistes d\'Azerbaïdjan, la province septentrionale qui était occupée par les troupes russes pendant la Seconde Guerre mondiale. Le Shah en uniforme lors d\'un défilé militaire, derrière lui un général plus tard exécuté par la Révolution. ', 'Shadi ahmadi', 'Le Shah en uniforme militaire', 5, 1),
(22, 'IRAN Tehran December 12, 1977. Iran celebrates the victory of its army over separatists of Azerbaidjan, the northern province which was occupied by Russian troops during WWII. The Shah in uniform at a military parade, behind him a General later executed by the Revolution.', 'Sherlock Holmes', 'The Shah in military uniform', 5, 2),
(23, 'IRAN Teheran, 12. Dezember 1977. Der Iran feiert den Sieg seiner Armee über Separatisten aus Aserbaidschan, der nordiranischen Provinz, die während des Zweiten Weltkriegs von russischen Truppen besetzt war. Der Schah in Uniform bei einer Militärparade, hinter ihm ein General, der später von der Revolution hingerichtet wurde. ', 'Alex schneider', 'Der Schah in Militäruniform', 5, 3),
(24, 'ایران، تهران ۱۲ دسامبر ۱۹۷۷. ایران جشن پیروزی ارتش خود را بر جدایی طلبان آذربایجان، استان شمالی که در طول جنگ جهانی دوم توسط نیروهای روسی مورد اشغال قرار گرفته بود، می‌گیرد. شاه در یک رژه نظامی پشت سر او یک ژنرال قرار دارد که بعدها توسط انقلاب اعدام شد. ', 'Shadi ahmadi', 'شاه در لباس نظامی ', 5, 4),
(25, '伊朗 德黑兰 1977年12月12日。伊朗庆祝其军队击败了阿塞拜疆分裂分子的胜利，这个北部省份在第二次世界大战期间曾被俄罗斯军队占领。 Shah身穿军装参加阅兵式，他身后是一位后来被革命处决的将军。', 'Huan lee', 'Shah穿着军装', 5, 6),
(26, 'IRAN Téhéran, 1979. Le portrait de l\'ayatollah Ruhollah Khomeini est exposé par la foule assistante à l\'ouverture de l\'université de Téhéran. Le futur Président de la République islamique Mahmoud Ahmadinejad se trouve en bas à droite, derrière l\'homme au chapeau de fourrure.', 'Shadi ahmadi', 'Revolution', 6, 1),
(27, 'IRAN Tehran, 1979. The portrait of Ayatollah Ruhollah Khomeini is displayed by the crowd attending the opening of Tehran University. The future President of the Islamic Republic, Mahmoud Ahmadinejad, is at the bottom right, behind the man in the fur hat. ', 'Sherlock Holmes', 'Revolution', 6, 2),
(28, 'IRAN Teheran, 1979. Das Porträt von Ayatollah Ruhollah Khomeini wird von der Menge ausgestellt, die die Eröffnung der Universität Teheran besucht. Der zukünftige Präsident der Islamischen Republik, Mahmoud Ahmadinejad, befindet sich unten rechts, hinter dem Mann mit dem Pelzhut.', 'Alex schneider', 'Revolution', 6, 3),
(29, 'ایران، تهران، ۱۹۷۹. تصویر امام روح‌الله خمینی توسط حاضرین در مراسم افتتاح دانشگاه تهران نمایش داده می‌شود. رئیس جمهور، محمود احمدی‌نژاد، در پایین سمت راست، پشت مردی با کلاه خز است.', 'Shadi ahmadi', 'انقلاب', 6, 4),
(30, '伊朗 德黑兰，1979年。阿亚图拉鲁霍拉·霍梅尼的肖像被出席德黑兰大学开幕式的人群展示。未来的伊斯兰共和国总统马哈茂德·艾哈迈迪内贾德位于右下角，站在戴皮草帽的人后面。', 'Huan lee', '革命', 6, 6),
(31, 'IRAN Téhéran. Décembre 1978. Des émeutiers brûlent un portrait du Shah en signe de protestation contre son régime.', 'Shadi ahmadi', 'Feu de colère', 7, 1),
(32, 'IRAN Tehran. December 1978. Rioters burn a portrait of the Shah as a sign of protest against his regime.', 'Sherlock Holmes', 'blaze of anger', 7, 2),
(33, 'IRAN Teheran. Dezember 1978. Randalierer verbrennen ein Porträt des Schahs als Protest gegen sein Regime.', 'Alex schneider', 'Zornesfeuer', 7, 3),
(34, 'ایران، تهران. دسامبر ۱۹۷۸. قیامکنندگان تصویر شاه را به عنوان نشانه‌ای از اعتراض به رژیم او سوزانده‌اند.', 'Shadi ahmadi', 'آتش خشم', 7, 4),
(35, '伊朗 德黑兰。1978年12月。一名暴乱者挥舞着一名被军队枪击致死的同志的鞋子。士兵辩称并不是他的部队开火的。', 'Huan lee', '怒火 ', 7, 6),
(36, 'IRAN Téhéran. Décembre 1978. Un émeutier brandit les chaussures d\'un camarade mort, tué par les tirs de l\'armée. Le soldat affirme que ce n\'était pas son unité qui avait ouvert le feu.', 'Shadi ahmadi', 'Ses chaussures', 8, 1),
(37, 'IRAN Tehran. December 1978. A rioter brandishes the shoes of a dead comrade, killed by army gunfire. The soldier argues that it was not his unit which opened fire.', 'Sherlock holmes', 'His shoes', 8, 2),
(38, 'IRAN Teheran. Dezember 1978. Ein Randalierer schwingt die Schuhe eines verstorbenen Kameraden, der durch Schüsse der Armee getötet wurde. Der Soldat behauptet, dass es nicht seine Einheit war, die das Feuer eröffnet hat.', 'seine Schuhe', 'Alex schneider', 8, 3),
(39, 'ایران، تهران. دسامبر ۱۹۷۸. یک قیام کننده کفش‌های یک همرزم فوت شده را که توسط شلیک ارتش کشته شده است، برمی‌افرازد. سرباز ادعا می‌کند که واحد او شلیک نکرده است.', 'Shadi ahmadi', 'کفش‌هایش', 8, 4),
(40, '伊朗 德黑兰。1978年12月。一名暴乱者挥舞着一名被军队枪击致死的同志的鞋子。士兵辩称并不是他的部队开火的。', 'Huan lee', '他的鞋', 8, 6),
(41, 'IRAN Téhéran. 25 janvier 1979. Après une manifestation au stade Amjadiyeh en soutien à la constitution et à Shapour BAKHTIAR, nommé Premier ministre par le Shah avant de quitter le pays, une femme, considérée comme une partisane du Shah, est prise à partie par une foule révolutionnaire.', 'Shadi ahmadi', 'Echappatoire', 9, 1),
(42, 'IRAN Tehran. January 25, 1979. After a demonstration at the Amjadiyeh Stadium in support of the constitution and of Shapour BAKHTIAR, who was appointed Prime Minister by the Shah before he left the country, a woman, believed to be a supporter of the Shah, is mobbed by a revolutionary crowd.', 'Sherlock holmes', 'escape', 9, 2),
(43, 'IRAN Teheran. 25. Januar 1979. Nach einer Demonstration im Amjadiyeh-Stadion zur Unterstützung der Verfassung und von Shapour BAKHTIAR, der vom Shah zum Premierminister ernannt wurde, bevor er das Land verließ, wird eine Frau, die als Anhängerin des Shahs gilt, von einer revolutionären Menge angegriffen.', 'Alex schneider', 'Flucht', 9, 3),
(44, 'ایران، تهران. ۲۵ ژانویه ۱۹۷۹. پس از یک تظاهرات در ورزشگاه امجدیه به حمایت از قانون اساسی و شاپور باختیار، که توسط شاه به عنوان نخست وزیر منصوب شده بود، پیش از اینکه از کشور برود، یک زن که باور می‌شود حامی شاه است، توسط یک جمعیت انقلابی مورد حمله قرار می‌گیرد.', 'Shadi ahmadi', 'فرار', 9, 4),
(50, '伊朗 德黑兰。1979年1月25日。在Amjadiyeh体育场举行的一次示威活动中，支持宪法和由沙阿任命的总理夏普尔·巴赫蒂亚尔，沙阿在离开国家之前任命他，一名被认为是沙阿支持者的女性被一群革命者围攻。', 'Huan lee', '逃跑', 9, 6),
(51, 'IRAN Téhéran. 8 avril 1979. Le corps de l\'ancien Premier ministre Amir Abbas Hoveyda repose à la morgue. Il a été rapidement exécuté après avoir été condamné par un tribunal islamique présidé par le mollah Sadegh Khalkali, surnommé le \"Juge Pendeur\". ', 'Shadi ahmadi', 'hoveyda', 10, 1),
(52, 'IRAN Tehran. April 8, 1979. The corpse of former Prime Minister Amir Abbas Hoveyda lies at the morgue. He was promptly executed after being sentenced by an Islamic tribunal presided over by mullah Sadegh Khalkali, the \"Hanging Judge\". ', 'Sherlock holmes', 'Hoveyda', 10, 2),
(53, 'IRAN Teheran. 8. April 1979. Die Leiche des ehemaligen Premierministers Amir Abbas Hoveyda liegt in der Leichenhalle. Er wurde kurz nach seiner Verurteilung durch ein islamisches Gericht unter dem Vorsitz des Mullahs Sadegh Khalkali, dem \"Henker-Richter\", hingerichtet. ', 'Alex schneider', 'Hoveyda', 10, 3),
(54, 'ایران، تهران. ۸ آوریل ۱۹۷۹. پیکر سابق نخست وزیر امیرعباس هویدا در پزشکی قانونی قرار دارد. او بلافاصله پس از صدور حکم توسط یک دادگاه اسلامی زیر نظر ملا صادق خلخالی، \"قاضی مرگ\"، به اعدام محکوم شد.', 'Shadi ahmadi', 'Hoveyda', 10, 4),
(55, ' 伊朗 德黑兰。1979年4月8日。前总理阿米尔·阿巴斯·霍维达的尸体躺在太平间。在一场由苏菲格·卡尔卡里法官主持的伊斯兰法庭宣判后，他迅速被处决，苏菲格·卡尔卡里被称为“吊死法官”。', 'Huan lee', 'Hoveydi', 10, 6),
(56, 'Iran 1980- 1989 Guerre Irak. Un homme saute dans une crevasse suite a une explosion.', 'Shadi ahmadi', 'Soldat', 11, 1),
(57, 'Iran 1980-1989 Iraq War. Photograph of a soldier jumping into a crevasse following an explosion. Fear is visible on his face.', 'Sherlock holmes', 'Soldier', 11, 2),
(58, 'Iran 1980-1989 Irakkrieg. Fotografie eines Soldaten, der nach einer Explosion in eine Kluft springt. Angst ist auf seinem Gesicht erkennbar.', 'Alex schneider', 'Soldat', 11, 3),
(59, 'جنگ ایران و عراق ۱۹۸۰-۱۹۸۹. عکس یک سرباز که پس از یک انفجار به یک چاه عمیق می‌پرد. ترس روی صورت او مشخص است.', 'Shadi ahmadi', 'سرباز', 11, 4),
(60, '1980-1989年伊朗伊拉克战争。一名士兵在爆炸后跳入裂缝中的照片。恐惧可见于他的脸上。', 'Huan lee', '士兵', 11, 6),
(61, 'Iran 1980- 1989 Guerre Irak. Un homme nourrit un blessé de guerre.', 'Shadi ahmadi', 'Blessé de guerre', 12, 1),
(62, 'Iran 1980-1989 Iraq War. A man feeds a wounded soldier.', 'Sherlock holmes', 'War wounded', 12, 2),
(63, 'Iran 1980-1989 Irakkrieg. Ein Mann füttert einen verwundeten Soldaten.', 'Alex schneider', 'Kriegsverletzter', 12, 3),
(64, 'جنگ ایران و عراق ۱۹۸۰-۱۹۸۹. یک مرد یک سرباز زخمی را تغذیه می‌کند.', 'Shadi ahmadi', 'زخمی جنگ', 12, 4),
(65, '1980-1989年伊朗伊拉克战争。一个男人喂养一名受伤的士兵。', 'Huan lee', '战伤者', 12, 6),
(66, 'Iran 1980- 1989 Guerre Irak. Photographie noir et blanc des mullah qui se réunissent. Ils organisent les prochaines attaquent.', 'Shadi ahmadi', 'Société des mullah', 13, 1),
(67, 'Iran 1980-1989 Iraq War. Black and white photograph of the mullahs gathering. They are planning the next attacks.', 'Sherlock holmes', 'Society of the mullahs', 13, 2),
(68, 'Iran 1980-1989 Irakkrieg. Schwarz-weiß Fotografie der Mullahs, die sich versammeln. Sie planen die nächsten Angriffe.', 'Alex schneider', 'Gesellschaft der Mullahs', 13, 3),
(69, 'جنگ ایران و عراق ۱۹۸۰-۱۹۸۹. عکس سیاه و سفیدی از ملاها که دور هم جمع می‌شوند. آنها حملات بعدی را برنامه‌ریزی می‌کنند.', 'Shadi ahmadi', 'انجمن ملاها', 13, 4),
(70, '1980-1989年伊朗伊拉克战争。黑白照片中的穆拉们聚集在一起。他们正在策划下一次袭击', 'Huan lee', '神职人员协会', 13, 6),
(71, 'Iran 1979. Des militaires courent dans la rue pendant la révolution. Au fond, des manifestants les confrontent.', 'Shadi ahmadi', 'Manifestation', 14, 1),
(72, 'Iran 1979. Soldiers are running in the street during the revolution. In the background, protesters confront them.', 'Sherlock holmes', 'Street war', 14, 2),
(73, 'Iran 1979. Soldaten rennen während der Revolution auf der Straße. Im Hintergrund konfrontieren sie Demonstranten.', 'Alex schneider', 'Straßenkrieg', 14, 3),
(74, 'ایران ۱۹۷۹. سربازان در حال دویدن، عکس در جریان انقلاب ایران گرفته شده است، خیابان به صحنه جنگ تبدیل شده است. در پس‌زمینه،', 'Shadi ahmadi', 'جنگ خیابانی', 14, 4),
(75, '1979年伊朗。革命期间，士兵在街上奔跑。背景中，抗议者与他们对峙。', 'Huan lee', '街头战争', 14, 6),
(76, 'Iran 1979. Des militaires courent dans la rue pendant la révolution.', 'Shadi ahmadi', 'Prisonnier de guerre', 15, 1),
(77, 'Iran 1979. Soldiers are running in the street during the revolution.', 'Sherlock holmes', 'warprisoners', 15, 2),
(78, 'Iran 1979. Soldaten rennen während der Revolution auf der Straße.', 'Alex schneider', 'Kriegsgefangene', 15, 3),
(79, 'ایران ۱۹۷۹. سربازان در حالی که انقلاب در جریان است، در خیابان دویدند.', 'Shadi ahmadi', 'زندانیان جنگ', 15, 4),
(80, '1979年的伊朗。士兵们在革命期间在街上奔跑', 'Huan lee', '战俘', 15, 6),
(81, 'Iran 1979. Un homme pleure sur le sang d\'un martyr dans la rue. Une fleur à la main pour se recueillir.', 'Shadi ahmadi', 'martyr', 16, 1),
(82, 'Iran 1979. A man weeps over the blood of a martyr in the street. Holding a flower in hand to mourn.', 'Sherlock holmes', 'Martyr', 16, 2),
(83, 'Iran 1979. Ein Mann weint über das Blut eines Märtyrers auf der Straße. Er hält eine Blume in der Hand, um zu trauern.', 'Alex schneider', 'Märtyrer', 16, 3),
(84, 'ایران ۱۹۷۹. یک مرد بر روی خون یک شهید در خیابان گریه می‌کند. با دست گلی را نگه داشته تا عزاداری کند.', 'Shadi ahmadi', 'شهید', 16, 4),
(85, '1979年的伊朗。一名男子在街头为一位烈士的血泪哀悼。手中拿着一朵花以示悼念', 'Shadi ahmadi', '烈士', 16, 6),
(86, 'Iran 1979. Des manifestants brandissent un journal indiquant que le Shah est parti.', 'Shadi ahmadi', 'Journaux', 17, 1),
(87, 'Iran 1979. Protesters are holding up a newspaper indicating that the Shah has left.', 'Sherlock holmes', 'Newspapers', 17, 2),
(88, 'Iran 1979. Demonstranten halten eine Zeitung hoch, die darauf hinweist, dass der Schah gegangen ist.', 'Alex schneider', 'Zeitung', 17, 3),
(89, 'ایران ۱۹۷۹. تظاهرکنندگان یک روزنامه را بالا می‌برند که نشان می‌دهد شاه رفته است.', 'Shadi ahmadi', 'روزنامه', 17, 4),
(90, '1979年的伊朗。抗议者举起一份报纸，显示国王已经离开。', 'Huan lee', '报纸', 17, 6),
(91, 'Des manifestants sont regroupés, armés et tirent vers les militaires.', 'Shadi ahmadi', 'Barricade', 18, 1),
(92, 'Protesters are gathered, armed, and shooting at the soldiers.', 'Sherlock holmes', 'barricade', 18, 2),
(93, 'Die Demonstranten sind versammelt, bewaffnet und schießen auf die Soldaten.', 'Alex schneider', 'Barrikade', 18, 3),
(94, 'تظاهرکنندگان جمع شده‌اند، مسلح هستند و به سمت سربازان شلیک می‌کنند.', 'Shadi ahmadi', 'سنگر', 18, 4),
(95, '抗议者集结在一起，持械并向士兵开火。', 'Huan lee', '路障', 18, 6),
(96, 'Un révolutionnaire portant un masque pendant la révolution. Cet homme a peur d\'être arrêté.', 'Shadi ahmadi', 'masque', 19, 1),
(97, 'A revolutionary wearing a mask during the revolution. This man is afraid of being arrested.', 'Sherlock holmes', 'Mask', 19, 2),
(98, 'Ein Revolutionär trägt während der Revolution eine Maske. Dieser Mann fürchtet, verhaftet zu werden.', 'Alex schneider', 'Maske', 19, 3),
(99, 'یک انقلابی در طول انقلاب یک ماسک می‌پوشد. این مرد از دستگیری می‌ترسد.', 'Shadi ahmadi', 'ماسک', 19, 4),
(100, '革命者在革命期间戴着面具。这个人害怕被逮捕。', 'Huan lee', '口罩', 19, 6),
(101, 'Iran 1980- 1989 Guerre Irak. Deux militaires qui évitent les balles et courent pour sauver leur vie. Cette scène se déroule en ville.', 'Shadi ahmadi', 'Guerre', 20, 1),
(102, 'Iran 1980-1989 Iraq War. Two soldiers dodging bullets and running to save their lives. This scene takes place in the city.', 'Sherlcok holmes', 'War', 20, 2),
(103, 'Iran 1980-1989 Irakkrieg. Zwei Soldaten, die Kugeln ausweichen und rennen, um ihr Leben zu retten. Diese Szene findet in der Stadt statt.', 'Alex schneider', 'Krieg', 20, 3),
(104, 'ایران ۱۹۸۰-۱۹۸۹. جنگ عراق. دو سرباز که از گلوله‌ها دوری می‌جویند و دویده به سمت نجات جان می‌روند. این صحنه در شهر اتفاق می‌افتد.', 'Shadi ahmadi', 'جنگ', 20, 4),
(105, '1980-1989年的伊朗伊拉克战争。两名士兵躲避子弹，奔跑求生。这一幕发生在城市中', 'Huan lee', '战争', 20, 6),
(106, 'Dans \"Les Mains Musulmanes et Juives\", Neshat explore les similitudes et les différences entre les gestes, les traditions et les symboles culturels des deux religions, mettant en évidence à la fois les points de convergence et les points de divergence. Par exemple, les mains pourraient être décorées de motifs traditionnels, de calligraphie ou de symboles religieux propres à chaque culture, mais elles pourraient aussi être représentées dans des gestes de salutation, de prière ou de travail, témoignant ainsi de la diversité des expériences humaines partagées.', 'Shadi ahmadi', 'Mains musulmanes et juives.', 21, 1),
(107, 'In \"Muslim and Jewish Hands,\" Neshat explores the similarities and differences between the gestures, traditions, and cultural symbols of both religions, highlighting both points of convergence and points of divergence. For example, hands could be adorned with traditional patterns, calligraphy, or religious symbols specific to each culture, but they could also be depicted in gestures of greeting, prayer, or work, thus bearing witness to the diversity of shared human experiences.\r\n', 'Sherlock Holmes', 'Muslim and Jewish hands.', 21, 2),
(108, 'In \"Muslimische und jüdische Hände\" erkundet Neshat die Ähnlichkeiten und Unterschiede zwischen den Gesten, Traditionen und kulturellen Symbolen beider Religionen und hebt dabei sowohl Konvergenzpunkte als auch Divergenzpunkte hervor. Zum Beispiel könnten Hände mit traditionellen Mustern, Kalligrafie oder religiösen Symbolen geschmückt sein, die jeder Kultur eigen sind, aber sie könnten auch in Gesten der Begrüßung, des Gebets oder der Arbeit dargestellt werden und so die Vielfalt gemeinsamer menschlicher Erfahrungen bezeugen.\r\n', 'Alex schneider', 'Muslimische und jüdische Hände.', 21, 3),
(109, 'در \"دست‌های مسلمان و یهودی\"، نشاط به بررسی تشابه‌ها و تفاوت‌ها بین حرکات، سنت‌ها و نمادهای فرهنگی دو دین می‌پردازد، همزمان با برجسته کردن نقاط همگرایی و اختلاف. به عنوان مثال، دست‌ها ممکن است با الگوهای سنتی، خطاطی یا نمادهای مذهبی خاص هر فرهنگ تزیین شوند، اما همچنین می‌توانند در حرکاتی از جلوه، نماز یا کار نمایان شوند، به این ترتیب به تنوع تجربیات انسانی مشترک شاهد باشند.', 'Shadi ahmadi', ' دست‌های مسلمان و یهودی. ', 21, 4),
(110, '在《穆斯林和犹太人的手》中，内沙特探索了两种宗教的手势、传统和文化符号之间的相似之处和不同之处，突出了收敛点和分歧点。例如，手可以装饰有传统图案、书法或每种文化特有的宗教符号，但它们也可以被描绘成问候、祈祷或工作的姿势，从而见证了共同人类经验的多样性。', 'Huan lee', '穆斯林和犹太人的手', 21, 6),
(111, 'C\'est l\'effort d\'une femme pour parler de la manière la plus indicible. (Rires) Elle touche ses lèvres avec ses doigts, comme si elle était sur le point d\'ouvrir la bouche, mais rien ne sort, et en fait ses mots sont inscrits sur ses mains.\r\n\r\nDans cette série, j\'ai décidé de me concentrer uniquement sur les parties du corps féminin qui sont autorisées à être exposées. Et la main, que je pense être une partie extrêmement expressive du corps d\'une femme, l\'œil, la lèvre, le pied sont devenus très vocaux dans mon travail.\r\n\r\nSur cette main, j\'ai utilisé la poésie d\'une poétesse très connue, appelée Forough Farrokhzad. Elle est probablement la femme écrivaine iranienne la plus significative de tous les temps. Dans ce poème, \"Je suis désolée pour le jardin\", elle utilise le jardin comme une métaphore pour une femme.', 'Shadi ahmadi', 'Main musulmane ', 22, 1),
(112, 'This is the effort of a woman to speak in the most unspeakable way. (Laughs) She\'s touching her lip with her fingers, as if she\'s just about to open her mouth, but nothing comes out, and in fact her words are inscribed on her hands.\r\n\r\nIn this series, I decided that I would only concentrate on those parts of the female body that are allowed to be exposed. And the hand, which I think is extremely expressive part of a woman\'s body, the eye, the lip, the feet became very vocal in my work.\r\n\r\nIn this hand I used the poetry of a very well known poet, called Forough Farrokhzad. She\'s probably the most significant Iranian woman writer ever. In this poem, \"I Feel Sorry for the Garden”, she uses the garden as a metaphor for a woman.', 'Sherlock holmes', 'Muslim Hands', 22, 2),
(113, 'Dies ist der Versuch einer Frau, auf die unaussprechlichste Weise zu sprechen. (Lacht) Sie berührt ihre Lippen mit ihren Fingern, als ob sie gerade den Mund öffnen würde, aber nichts kommt heraus, und tatsächlich sind ihre Worte auf ihren Händen verzeichnet.\r\n\r\nIn dieser Serie habe ich beschlossen, mich nur auf diejenigen Teile des weiblichen Körpers zu konzentrieren, die erlaubt sind, offen gezeigt zu werden. Und die Hand, die ich für einen äußerst ausdrucksstarken Teil des weiblichen Körpers halte, das Auge, die Lippe, der Fuß, wurden in meiner Arbeit sehr stimmhaft.\r\n\r\nAuf dieser Hand habe ich die Poesie einer sehr bekannten Dichterin verwendet, namens Forough Farrokhzad. Sie ist wahrscheinlich die bedeutendste iranische Schriftstellerin aller Zeiten. In diesem Gedicht, \"Es tut mir leid für den Garten\", verwendet sie den Garten als Metapher für eine Frau.', 'Alex schneider', 'Muslimische Hand', 22, 3),
(114, 'این تلاش یک زن برای صحبت کردن به شکل ناگفتنی‌ترین است. (خنده) او لبان خود را با انگشتانش لمس می‌کند، به نظر می‌رسد که دقیقاً در حال باز کردن دهان است، اما هیچ چیزی خارج نمی‌شود، و در واقع کلماتش بر روی دست‌هایش نوشته شده است.\r\n\r\nدر این سری، تصمیم گرفتم که فقط بر روی بخش‌هایی از بدن زنان که مجاز به نمایش است تمرکز کنم. و دست، که فکر می‌کنم بخش بسیار بیان‌گر بدن یک زن است، چشم، لب، پا در کار من بسیار بیان‌گر شدند.\r\n\r\nدر این دست از شعر یک شاعر بسیار معروف به نام فروغ فرخزاد استفاده کردم. او احتمالاً مهم‌ترین نویسنده زن ایرانی تاریخ است. در این شعر، \"متأسفم برای باغ\"، او از باغ به عنوان یک استعاره برای یک زن استفاده می‌کند.', 'Shadi ahmadi', 'دست مسلمان ', 22, 4),
(115, '这是一个女人以最难以言喻的方式说话的努力。(笑) 她用手指触摸着自己的嘴唇，仿佛她就要张开嘴，但是什么也没有说出来，事实上她的话被刻在她的手上。\r\n\r\n在这个系列中，我决定只集中在那些允许暴露的女性身体部位上。而我认为手是女性身体中极具表现力的部分，眼睛、嘴唇、脚在我的作品中变得非常有声音。\r\n\r\n在这只手上，我使用了一位非常著名的诗人的诗歌，她叫福鲁格·法鲁克扎德。她可能是有史以来最重要的伊朗女作家。在这首诗中，“我为花园感到抱歉”，她把花园比作一个女人的隐喻。', 'Huan lee', '穆斯林', 22, 6),
(116, 'Dans \"Silence Rebelle\", le portrait de la figure centrale est coupé en deux le long d\'une couture verticale créée par le long canon d\'un fusil. Présumément, le fusil est serré dans ses mains près de ses genoux, mais l\'image est recadrée de sorte que le fusil se dresse perpendiculairement au bord inférieur de la photo et effleure son visage au niveau des lèvres, du nez et du front. Les yeux de la femme fixent intensément le spectateur de chaque côté de cette division.', 'Shadi ahmadi', 'Rebellion silencieuse', 23, 1),
(117, 'In Rebellious Silence, the central figure’s portrait is bisected along a vertical seam created by the long barrel of a rifle. Presumably the rifle is clasped in her hands near her lap, but the image is cropped so that the gun rises perpendicular to the lower edge of the photo and grazes her face at the lips, nose, and forehead. The woman’s eyes stare intensely towards the viewer from both sides of this divide.', 'Sherlock holmes', 'Rebellious Silence', 23, 2),
(118, 'In \"Rebellische Stille\" ist das Porträt der zentralen Figur entlang einer vertikalen Naht, die durch den langen Lauf eines Gewehrs entsteht, in zwei Hälften geteilt. Vermutlich hält die Frau das Gewehr nahe ihres Schoßes in den Händen, aber das Bild ist so beschnitten, dass das Gewehr senkrecht zum unteren Rand des Fotos steht und ihr Gesicht an den Lippen, der Nase und der Stirn berührt. Die Augen der Frau starren intensiv auf den Betrachter von beiden Seiten dieser Teilung.', 'Alex schneider', 'Aufsässiges Schweigen', 23, 3),
(119, 'در \"سکوت شورانگیز\"، پرتره شخصیت مرکزی به وسیلهٔ یک درز عمودی از جنبه بلند یک تفنگ به دو نیمه تقسیم می‌شود. احتمالاً تفنگ در دست‌هایش نزدیک زانویش نگه داشته شده است، اما تصویر به‌طوری که تفنگ عمود بر لبه پایین عکس ایستاده و صورت او را در لبه‌های لب، بینی و پیشانی برمی‌دارد، برش داده شده است. چشم‌های زن از هر دو طرف این تقسیم با تمام شدت به نگاه بیننده خیره شده‌اند.\r\n', 'Shadi ahmadi', 'سکوت شوریده', 23, 4),
(120, '在《叛逆的沉默》中，中央人物的肖像被一支长枪的竖直接缝分成两半。据推测，枪可能是夹在她的手中靠近膝盖附近，但图片被裁剪得使枪直立于照片的下边缘，并在她的脸上触及嘴唇、鼻子和额头。女人的眼睛从这个分裂的两侧向观众投射出强烈的目光。\r\n', 'Huan lee', '反叛的沉默', 23, 6),
(121, 'La photo, réalisée à l\'encre sur un tirage résiné, provient de la série \"Femmes d\'Allah\" de Neshat, qu\'elle a réalisée dans les années 1990 après son premier voyage en Iran après la révolution. Quatre éléments symboliques contribuent à la beauté mélancolique de la série, explique Neshat dans le livre où nous avons trouvé cette image : \"le voile, le fusil, le texte et le regard\". L\'absence du fusil rend cette photo plus intemporelle que la plupart des autres, et quelque chose de similaire se produit dans son texte. \"Bien que les mots en farsi écrits sur les surfaces des œuvres puissent sembler être un dispositif décoratif\", écrit Neshat, \"ils contribuent à une signification significative. Les textes sont des amalgames de poèmes et de prose principalement écrits par des écrivaines contemporaines en Iran. Ces écrits incarnent parfois des opinions politiques et idéologiques diamétralement opposées, allant du totalement laïc aux slogans islamiques fanatiques du martyre et du sacrifice de soi jusqu\'aux méditations poétiques, sensuelles et même sexuelles.\"\r\n', 'Shadi ahmadi', 'Secret', 24, 1),
(122, 'The picture, made of ink on a resin-coated print, comes from Neshat’s series “Women of Allah,” which she made in the 1990s after her first trip to Iran after the revolution. Four symbolic elements help build the series’s melancholic beauty, Neshat explains in the book where we found this image: “the veil, the gun, the text and the gaze.” The missing gun renders this picture more timeless than most of the others, and something similar is at work in its text. “Although the Farsi words written on the works’ surfaces may seem like a decorative device,” Neshat writes, “they contribute significant meaning. The texts are amalgams of poems and prose works mostly by contemporary women writers in Iran. These writings embody sometimes diametrically opposing political and ideological views, from the entirely secular to fanatic Islamic slogans of martyrdom and self-sacrifice to poetic, sensual and even sexual meditations.', 'Sherlock holmes', 'Secret', 24, 2),
(123, 'Das Bild, das aus Tinte auf einem harzbeschichteten Druck besteht, stammt aus Neshats Serie \"Frauen von Allah\", die sie in den 1990er Jahren nach ihrer ersten Reise in den Iran nach der Revolution erstellt hat. Vier symbolische Elemente tragen zur melancholischen Schönheit der Serie bei, erklärt Neshat in dem Buch, in dem wir dieses Bild gefunden haben: \"der Schleier, das Gewehr, der Text und der Blick\". Das fehlende Gewehr macht dieses Bild zeitloser als die meisten anderen, und etwas Ähnliches geschieht in seinem Text. \"Obwohl die auf den Oberflächen der Werke geschriebenen persischen Worte wie ein dekoratives Element erscheinen mögen\", schreibt Neshat, \"tragen sie eine bedeutende Bedeutung bei. Die Texte sind eine Mischung aus Gedichten und Prosawerken, hauptsächlich von zeitgenössischen Schriftstellerinnen im Iran verfasst. Diese Schriften verkörpern manchmal diametral entgegengesetzte politische und ideologische Ansichten, von vollkommen säkular bis zu fanatischen islamischen Parolen des Märtyrertums und Selbstopfers bis hin zu poetischen, sinnlichen und sogar sexuellen Meditationen.', 'Alex schneider', 'Geheimnis', 24, 3),
(124, 'تصویری که از جوهر بر روی چاپ رزینی ساخته شده است، از سری \"زنان خدا\" نشات است، که او در دهه ۱۹۹۰ بعد از سفر اول خود به ایران پس از انقلاب ساخت. چهار عنصر نمادین به زیبایی ملایم این سری کمک می‌کنند، نشات در کتابی که ما این تصویر را در آن یافتیم توضیح می‌دهد: \"حجاب، تفنگ، متن و نگاه\". عدم حضور تفنگ این تصویر را بیشتر از بیشتر تصاویر دیگر، بی‌زمان‌تر می‌کند، و چیزی مشابه در متن آن نیز در حال کار است. \"اگرچه کلمات فارسی نوشته شده بر روی سطوح این اثار ممکن است به عنوان یک دستگاه تزئینی به نظر برسند\"، نشاط می‌نویسد، \"اما به معنای قابل توجهی کمک می‌کنند. متون ترکیبی از شعر و نثر اغلب توسط نویسندگان زن معاصر در ایران هستند. این نوشته‌ها بعضاً نمایانگر دیدگاه‌های سیاسی و ایدئولوژیکی دیامترالیا مخالف هستند، از کاملاً سکولار تا شعارهای اسلامی متعصبانه از شهادت و خودفدا تا تامل‌های شعری، حسی و حتی جنسی.', 'Shadi ahmadi', 'راز', 24, 4),
(125, ' 这张图片是用墨水在树脂涂层的照片上制作的，来自内沙特的《真主之女》系列，这是她在1990年代首次访问伊朗后的作品。内沙特在我们找到这张图片的书中解释说，四个象征性的元素帮助构建了这个系列的忧郁之美：“面纱、枪、文字和目光”。缺少的枪使这张图片比大多数其他图片更具时间性，而在其文字中也有类似的作用。“尽管写在作品表面上的波斯语词汇可能看起来像是一种装饰性设备”，内沙特写道，“但它们贡献了重要的含义。这些文字是主要由伊朗当代女性作家创作的诗歌和散文的融合体。这些著作有时代表着截然相反的政治和意识形态观点，从完全世俗到狂热的伊斯兰口号，以至于诗意、感性甚至性别的冥想。', 'Huan lee', '秘密', 24, 6),
(126, 'Une femme le regard porté sur l\'objectif brandit une arme de guerre en direction de celui-ci. Cela donne un sentiment de pouvoir.', 'Shadi ahmadi', 'viser', 25, 1),
(127, 'A woman, her gaze fixed on the camera, brandishes a firearm towards it. It gives a sense of power.', 'Sherlock holmes', 'Aim', 25, 2),
(128, 'Eine Frau, ihr Blick auf das Objektiv gerichtet, schwingt eine Kriegswaffe in seine Richtung. Es vermittelt ein Gefühl von Macht.', 'Alex schneider', 'Ziel', 25, 3),
(129, 'یک زن با نگاهش به دوربین، یک اسلحه جنگی را به طرف آن برمی‌دارد. این احساس قدرت را به وجود می‌آورد.', 'Shadi ahmadi', 'هدف', 25, 4),
(130, '一名女子，目光凝视着镜头，挥舞着一把战争武器。这给人一种权力的感觉。', 'Huan lee', '目标', 25, 6),
(131, 'Dans \"Mother and Son\", une femme, probablement la mère, est assise devant un jeune garçon. La femme regarde directement vers l\'objectif de la caméra avec une expression sérieuse et déterminée, tandis que le garçon, qui semble être son fils, se tient à côté d\'elle, également regardant dans la même direction. La composition de l\'image met en évidence le lien émotionnel entre la mère et son enfant, tout en suggérant une certaine tension ou préoccupation dans leur regard.', 'Shadi ahmadi', 'mère et fils', 26, 1),
(132, 'In \"Mother and Son,\" a woman, presumably the mother, is seated in front of a young boy. The woman looks directly towards the camera lens with a serious and determined expression, while the boy, who appears to be her son, stands beside her, also looking in the same direction. The composition of the image highlights the emotional bond between the mother and her child, while suggesting some tension or concern in their gaze.', 'Sherlock holmes', 'mother and son', 26, 2),
(133, 'In \"Mutter und Sohn\" sitzt eine Frau, wahrscheinlich die Mutter, vor einem jungen Jungen. Die Frau schaut mit einem ernsten und entschlossenen Ausdruck direkt auf das Kamerobjektiv, während der Junge, der anscheinend ihr Sohn ist, neben ihr steht und ebenfalls in die gleiche Richtung schaut. Die Komposition des Bildes betont die emotionale Bindung zwischen Mutter und Kind und deutet gleichzeitig auf eine gewisse Spannung oder Besorgnis in ihrem Blick hin.', 'Alex schneider', 'Mutter und Sohn ', 26, 3),
(134, 'در \"مادر و پسر\"، یک زن، احتمالاً مادر، پشت یک پسر جوان نشسته است. زن با یک عبور جدی و مصمم به سمت لنز دوربین نگاه می‌کند، در حالی که پسر، که به نظر می‌رسد پسر اوست، در کنار او ایستاده و همچنین به همان جهت نگاه می‌کند. ترکیب تصویر ارتباط عاطفی بین مادر و فرزندش را برجسته می‌کند، در حالی که به تنش یا نگرانی معینی در نگاه آن‌ها اشاره می‌کند.', 'Shadi ahmadi', 'مادر و پسر', 26, 4),
(135, '在《母与子》中，一名女性，可能是母亲，坐在一个年轻男孩面前。这名女性直视着摄像机镜头，表情严肃而坚决，而这个男孩，看起来像是她的儿子，站在她旁边，也朝着同一个方向看去。图片的构图突出了母亲与孩子之间的情感联系，同时暗示着他们眼神中的一些紧张或关切。', 'Huan lee', '母亲和儿子', 26, 6),
(136, 'Photographie d\'une femme. Elle couvre son visage avec ses deux mains, elle porte un voile noir. Ses bras sont couvert d\'encre représentant l\'arbre de vie.', 'Shadi ahmadi', 'Dépouillé', 27, 1),
(137, 'Photograph of a woman. She covers her face with both hands, wearing a black veil. Her arms are covered in ink depicting the tree of life.', 'Sherlock holmes', 'Stripped ', 27, 2),
(138, 'Fotografie einer Frau. Sie bedeckt ihr Gesicht mit beiden Händen und trägt einen schwarzen Schleier. Ihre Arme sind mit Tinte bedeckt, die den Lebensbaum darstellt.', 'Alex schneider', 'Entkleidet ', 27, 3),
(139, 'عکس یک زن. او چهره‌اش را با دو دست پوشانده است، که یک حجاب سیاه می‌پوشد. بازوهایش پر از جوهری است که درخت زندگی را نشان می‌دهد.', 'Shadi ahmadi', 'برهنه', 27, 4),
(140, '一张女人的照片。她用双手遮住了脸，戴着一条黑色面纱。她的手臂上涂满了描绘生命之树的墨水。', 'Huan lee', '剥夺', 27, 6),
(141, 'Unveiling de Shirin Neshat (1993) explore la politique des femmes vivant derrière \"le voile\" dans les pays islamiques. Cette exposition multimédia présentait des photographies, des sculptures et des films qui exprimaient les expériences affectives des femmes portant des voiles. En travaillant à travers ces médiums, Neshat intégrait des textes du poète iranien Furugh Farrukzad, dont le travail est considéré comme l\'une des expressions les plus radicales de la sensualité et de l\'indépendance féminines. Tout en notant les complexités du voile, elle ne critique pas les valeurs traditionnelles de ce vêtement pour les femmes contemporaines. Pour Neshat, la question fondamentale est ce qui façonne l\'expérience féminine : le voile ou le corps ? Elle met également en lumière les problèmes de transposition des politiques d\'identité féministe occidentale sur les cultures islamiques. En fin de compte, Neshat crée de nouvelles compréhensions du voile, tout en remettant en question les stéréotypes sur l\'identité féminine dans l\'islam.\r\n', 'Shadi ahmadi', 'Dévoilement ', 28, 1),
(142, 'Shirin Neshat’s Unveiling (1993) explores the politics of women living behind “the veil” in Islamic countries. This multimedia exhibition featured photographs, sculptures, and films that expressed women’s affective experiences of wearing veils. Working across these mediums, Neshat integrated text from the Iranian poet Furugh Farrukzad—whose work is considered to be one of the most radical expressions of female sensuality and independence. While noting the complexities of the veil, she does not criticize the garment’s traditional values for contemporary women. For Neshat, the fundamental question is what shapes the female experience: the veil or the body? She also brings into focus the problems of transposing Western feminist identity politics onto Islamic cultures. Ultimately, Neshat creates new understandings of the veil, while challenging stereotypes about female identity in Islam.', 'Sherlock holmes', 'Unveiling', 28, 2),
(143, 'Unveiling von Shirin Neshat (1993) erforscht die Politik der Frauen, die in islamischen Ländern hinter \"dem Schleier\" leben. Diese multimediale Ausstellung zeigte Fotografien, Skulpturen und Filme, die die affektiven Erfahrungen von Frauen beim Tragen von Schleiern ausdrückten. Neshat integrierte Texte des iranischen Dichters Furugh Farrukzad, dessen Werk als eine der radikalsten Ausdrucksformen der weiblichen Sinnlichkeit und Unabhängigkeit gilt. Obwohl sie die Komplexitäten des Schleiers bemerkt, kritisiert sie nicht die traditionellen Werte dieses Kleidungsstücks für zeitgenössische Frauen. Für Neshat ist die grundlegende Frage, was die weibliche Erfahrung prägt: der Schleier oder der Körper? Sie richtet auch den Fokus auf die Probleme der Übertragung westlicher feministischer Identitätspolitiken auf islamische Kulturen. Letztendlich schafft Neshat neue Verständnisse des Schleiers und fordert gleichzeitig Stereotypen über die weibliche Identität im Islam heraus.\r\n', 'Alex schneider', 'Enthüllung ', 28, 3),
(144, 'نمایشگاه «بی‌پوشش» (Unveiling) شیرین نشاط (1993) مسائل زنانی را که در کشورهای اسلامی پشت \"حجاب\" زندگی می‌کنند، بررسی می‌کند. این نمایش چندرسانه‌ای عکس‌ها، مجسمه‌ها و فیلم‌هایی را ارائه می‌کرد که تجربیات احساسی زنان در پوشیدن حجاب را بیان می‌کرد. با کار کردن در این وسایل، نشات متونی از شاعر ایرانی فروغ فرخزاد - که اثر او به عنوان یکی از بیانات بیشترین رادیکالیسم حسی و استقلال زنان شناخته می‌شود - را گنجانده است. در حالی که به پیچیدگی‌های حجاب اشاره می‌کند، او ارزش‌های سنتی این لباس برای زنان معاصر را انتقاد نمی‌کند. برای نشات، سؤال اساسی این است که تجربه زنان را چه چیزی شکل می‌دهد: حجاب یا بدن؟ او همچنین مشکلات انتقال سیاست‌های هویتی فمینیستی غربی به فرهنگ‌های اسلامی را مورد توجه قرار می‌دهد. در نهایت، نشاط درک‌های جدیدی از حجاب ایجاد می‌کند، در حالی که استریوتیپ‌هایی درباره هویت زنانه در اسلام را مورد چالش قرار می‌دهد.', 'Shadi ahmadi', 'افشا', 28, 4),
(145, 'Shirin Neshat的《揭示》（1993年）探讨了在伊斯兰国家生活在“面纱”背后的妇女的政治。这个多媒体展览展示了照片、雕塑和电影，表达了女性戴面纱的情感体验。在这些媒介中工作时，内沙特融入了伊朗诗人Furugh Farrukzad的文本——他的作品被认为是女性感性和独立性的最激进表达之一。尽管注意到面纱的复杂性，但她并不批评这种服装对当代女性的传统价值观。对于内沙特来说，根本问题是什么塑造了女性的经验：面纱还是身体？她还将焦点放在将西方女性主义身份政治移植到伊斯兰文化中的问题上。最终，内沙特创造了对面纱的新理解，同时挑战了有关伊斯兰教中女性身份的刻板印象。', 'Huan lee', '揭示', 28, 6),
(146, 'Photo des pieds d\'une femme qui tient une arme de guerre. Ses pieds contiennent des inscriptions, correspondant à un poème d\'alliance.', 'Shadi ahmadi', 'Allégeance à l\'éveil ', 29, 1),
(147, 'Photo of a woman\'s feet holding a firearm. Her feet contain inscriptions corresponding to a poem of alliance.', 'Sherlock holmes', 'Allegiance with wakefulness', 29, 2),
(148, 'Foto von den Füßen einer Frau, die eine Kriegswaffe hält. Ihre Füße enthalten Inschriften, die einem Bündnisgedicht entsprechen.', 'Alex schneider', 'Treue zur Wachsamkeit ', 29, 3),
(149, 'عکس پاهای یک زن که یک اسلحه جنگی را در دست دارد. پاهایش حاوی نقوشی هستند که با یک شعر ائتلاف مطابقت دارند.', 'Shadi ahmadi', 'وفاداری با بیداری', 29, 4),
(150, '一张女人脚部的照片，她手持一支战争武器。她的脚上有刻着一首联盟诗的文字。', 'Huan lee', '与警醒同盟', 29, 6),
(151, 'Femme photographié, tenant une fleur sans ses mains rouges, symbolisant le côté martyr.\r\nEn arrière plan, un texte est affiché. Ce dernier raconte le désir selon les martyr.\r\n', 'Shadi ahmadi', 'Recherche du martyre ', 30, 1),
(152, 'Photographed woman holding a flower with her red hands, symbolizing the martyr aspect. In the background, text is displayed. It narrates the desire according to the martyrs.', 'Sherlock holmes', 'Seeking martyrdom', 30, 2),
(153, 'Fotografierte Frau, die eine Blume mit ihren roten Händen hält, was den Märtyrer-Aspekt symbolisiert. Im Hintergrund wird ein Text angezeigt. Dieser erzählt das Verlangen gemäß den Märtyrern.', 'Alex schneider', 'Streben nach Märtyrertum', 30, 3),
(154, 'زنی که تصویربرداری شده، دستان قرمز خود را با گل در دست دارد که نماد شهادت است. در پس‌زمینه، متنی نمایش داده می‌شود. این متن، آرزو را بر اساس شهیدان توضیح می‌دهد.', 'Shadi ahmadi', 'جستجوی شهادت', 30, 4),
(155, '拍摄的女性手持一朵花，她的双手红彤彤的，象征着烈士的一面。背景中，显示着一段文字。它讲述了烈士的愿望。', 'Huan lee', '寻求殉道', 30, 6),
(156, 'Cette peinture à l\'huile utilise majoritairement des couleurs froides comme le bleu clair, le blanc, avec des tons de bleu plus foncé et de noir. Des éléments oranges et rouges viennent ponctuer la toile. Au plan intermédiaire commencent à apparaître des formes hautes derrières lesquelles nous voyons apparaitre, au dernier plan, des formes pouvant représenter une civilisation. ', 'Shadi ahmadi', 'Soif du désert', 31, 1),
(157, 'This oil painting predominantly uses cool colors such as light blue, white, with shades of darker blue and black. Orange and red elements punctuate the canvas. In the middle ground, tall shapes begin to emerge, behind which we see, in the background, shapes that could represent a civilization.', 'Sherlock holmes', 'Thirst of Desert', 31, 2),
(158, 'Dieses Ölgemälde verwendet hauptsächlich kühle Farben wie helles Blau, Weiß, mit Schattierungen von dunklerem Blau und Schwarz. Orange und rote Elemente setzen Akzente auf der Leinwand. Im Mittelgrund beginnen hohe Formen zu erscheinen, hinter denen wir im Hintergrund Formen sehen, die eine Zivilisation darstellen könnten.\r\n', 'Alex schneider', 'Durst der Wüste', 31, 3),
(159, 'این نقاشی روغنی از طیف رنگی از رنگ‌های سرد مانند آبی روشن، سفید، با سایه‌های آبی تیره و سیاه استفاده اصلی می‌کند. عناصر نارنجی و قرمز نقاشی را تزین می‌کنند. در پیش‌زمینه، اشکال بلند شروع به ظاهر شدن می‌کنند، پشت آنها، در پس‌زمینه، اشکالی که ممکن است یک تمدن را نشان دهند ظاهر می‌شوند.', 'Shadi ahmadi', 'تشنگی بیابان', 31, 4),
(160, '这幅油画主要使用了冷色调，如浅蓝色、白色，以及深蓝色和黑色的色调。橙色和红色元素点缀着画布。在中间地带，高大的形状开始显现，而在背景中，我们看到了可能代表一个文明的形状。', 'Huan lee', '沙漠的渴望', 31, 6),
(161, 'Cette peinture à l\'huile est composée de tons chauds, majoritairement du rouge, du marron et du noir, avec quelques touches de bleu et de gris à l\'arrière plan. Des formes semblent se tenir près d\'un vase rectangulaire contenant une fleur. A la droite de ce vase se trouve des feuilles flottantes formant un cercle avec une goutte au milieu. ', 'Shadi ahmadi', 'Grandir de cette manière ', 32, 1),
(162, 'This oil painting is composed of warm tones, predominantly red, brown, and black, with some touches of blue and gray in the background. Shapes seem to stand near a rectangular vase containing a flower. To the right of this vase are floating leaves forming a circle with a drop in the middle.', 'Sherlock holmes', 'Growing in this way', 32, 2),
(163, 'Dieses Ölgemälde besteht aus warmen Tönen, hauptsächlich Rot, Braun und Schwarz, mit einigen blauen und grauen Akzenten im Hintergrund. Formen scheinen sich neben einer rechteckigen Vase zu befinden, die eine Blume enthält. Rechts von dieser Vase befinden sich schwebende Blätter, die einen Kreis mit einem Tropfen in der Mitte bilden.', 'Alex schneider', 'Auf diese Weise wachsen ', 32, 3),
(164, 'این نقاشی روغنی از طیف رنگی گرم تشکیل شده است، به طور اصلی قرمز، قهوه‌ای و سیاه، با برخی لمس‌های آبی و خاکستری در پس‌زمینه. اشکال به نظر می‌رسد در کنار یک بیمارستان مستطیلی که شامل یک گل است، ایستاده‌اند. در سمت راست این بیمارستان برگ‌های شناوری وجود دارد که یک حلقه را با یک قطره در میان تشکیل می‌دهند.', 'Shadi ahmadi', 'رشد به این شک', 32, 4),
(165, '这幅油画由温暖的色调组成，主要是红色、棕色和黑色，背景中还有一些蓝色和灰色的点缀。形状似乎站在一个长方形花瓶旁边，花瓶里装着一朵花。在这个花瓶的右侧，有一些漂浮的叶子，形成一个中间有一滴的圆圈。', 'Huan lee', '以这种方式成长', 32, 6),
(166, 'Peinture à l\'huile utilisant des tons de bleus et rouge au plan intermédiaire, avec des tons bleus et blancs au premier et dernier plan. Le point focal de l\'oeuvre se trouve au plan intermédiaire à gauche. ', 'Shadi ahmadi', 'Espace, lumière, mouvement ', 33, 1),
(167, 'Oil painting using shades of blue and red in the middle ground, with blue and white tones in the foreground and background. The focal point of the work is in the middle ground on the left.\r\n', 'Sherlock holmes', 'Space, light, motion', 33, 2),
(168, 'Ölgemälde mit blauen und roten Tönen im Mittelgrund, mit blauen und weißen Tönen im Vorder- und Hintergrund. Der Brennpunkt des Werkes befindet sich im Mittelgrund auf der linken Seite.\r\n', 'alex schneider', 'Raum, Licht, Bewegung ', 33, 3),
(169, 'نقاشی روغنی با استفاده از سایه‌های آبی و قرمز در پشت زمینه، با سایه‌های آبی و سفید در پیش‌زمینه و پس‌زمینه. نقطه محوری اثر در پشت‌زمینه سمت چپ قرار دارد.', 'Shadi ahmadi', 'فضا، نور، حرکت', 33, 4),
(170, '这幅油画在中间地带使用了蓝色和红色的色调，前景和背景则使用了蓝色和白色的色调。作品的焦点在左侧的中间地带。', 'Huan lee', '空间，光，运动', 33, 6),
(171, 'Cette peinture à l\'huile utilise principalement des tons froids, bleu, blanc, noir, gris. Au plan intermédiaire on observe une branche composée de quelques feuilles et de cinq fleurs blanches, dont le centre est composé d\'une perle. ', 'Shadi ahmadi', 'Froid', 34, 1),
(172, 'This oil painting mainly uses cool tones, blue, white, black, gray. In the middle ground, we see a branch composed of a few leaves and five white flowers, with the center composed of a pearl.\r\n', 'Sherlock holmes', 'Cold ', 34, 2),
(173, 'Dieses Ölgemälde verwendet hauptsächlich kühle Töne wie Blau, Weiß, Schwarz, Grau. Im Mittelgrund sehen wir einen Ast, der aus einigen Blättern und fünf weißen Blüten besteht, deren Mitte aus einer Perle besteht.', 'Alex schneider', 'Kalt', 34, 3),
(174, 'این نقاشی روغنی اصلی‌ترین از طیف‌های سرد مانند آبی، سفید، سیاه و خاکستری استفاده می‌کند. در پشت‌زمینه، ما یک شاخه از چندین برگ و پنج گل سفید می‌بینیم، که مرکز آنها از یک مروارید تشکیل شده است.', 'Shadi ahmadi', 'سرد', 34, 4),
(175, '这幅油画主要使用冷色调，如蓝色、白色、黑色、灰色。在中间地带，我们看到一根由几片叶子和五朵白色花组成的树枝，花的中心由一颗珍珠组成。', 'Huan lee', '冷', 34, 6),
(176, 'Cette peinture à l\'huile est composée au premier plan, de marron, bleu et gris où l\'on aperçoit les perles qui composent le centre des fleurs blanches que l\'on peut apercevoir au plan intermédiaire. Tandis que l\'arrière plan est principalement composé de deux bandes de couleurs, une noire et une gris/bleu. ', 'Shadi ahmadi', 'Illusion', 35, 1),
(177, 'This oil painting is composed in the foreground of brown, blue, and gray where one can see the pearls that make up the center of the white flowers that can be seen in the middle ground. While the background is mainly composed of two strips of colors, one black and one gray/blue.', 'Sherlock holmes', 'Ilusion', 35, 2),
(178, 'Dieses Ölgemälde besteht im Vordergrund aus Braun, Blau und Grau, wo man die Perlen sieht, die das Zentrum der weißen Blumen bilden, die im Mittelgrund zu sehen sind. Der Hintergrund besteht hauptsächlich aus zwei Farbstreifen, einem schwarzen und einem grau/blauen.', 'Alex schneider', 'Illusion ', 35, 3),
(179, 'این نقاشی روغنی در پیش‌زمینه از رنگ قهوه‌ای، آبی و خاکستری تشکیل شده است که می‌توانید مرواریدها را که مرکز گل‌های سفید را تشکیل می‌دهند که در پشت‌زمینه دیده می‌شوند، ببینید. در حالی که پس‌زمینه اصلی از دو باند رنگی تشکیل شده است، یکی سیاه و دیگری خاکستری/آبی.', 'Shadi ahmani', 'وهم', 35, 4),
(180, '这幅油画的前景由棕色、蓝色和灰色组成，可以看到构成中间地带的白色花朵中心的珍珠。而背景主要由两条颜色条带组成，一条黑色，一条灰/蓝色。', 'Huan lee', '幻觉', 35, 6),
(181, 'Cette peinture surréaliste montre un point d\'eau entouré d\'un désert. A l\'arrière plan on observe un point de lumière chaud entouré de faisceaux qui semblent s\'en échapper. ', 'Shadi ahmani', 'Soleil brisé ', 36, 1),
(182, 'This surrealistic painting depicts a water point surrounded by a desert. In the background, we observe a warm light point surrounded by beams that seem to emanate from it.', 'Sherlock holmes', 'Broken sun', 36, 2),
(183, 'Dieses surrealistische Gemälde zeigt einen Wasserpunkt, der von einer Wüste umgeben ist. Im Hintergrund sehen wir einen warmen Lichtpunkt, der von Strahlen umgeben ist, die zu entweichen scheinen.', 'Alex schneider', 'Gebrochene Sonne ', 36, 3),
(184, 'این نقاشی سوررئالیستی نقطه‌ای از آب را نشان می‌دهد که توسط یک بیابان احاطه شده است. در پس‌زمینه، یک نقطه نور گرم را مشاهده می‌کنیم که توسط پرتوهایی احاطه شده است که به نظر می‌رسد از آن بیرون می‌آیند.', 'Shadi ahmani', 'خورشید شکسته', 36, 4),
(185, '这幅超现实主义的画展示了一处被沙漠环绕的水点。在背景中，我们观察到一个温暖的光点，被看似从中散发出来的光束所环绕。', 'Huan lee', '破碎的太阳', 36, 6),
(186, 'Cette peinture composée de blanc, rouge, bleu et gris montre un chemin désertique qui semble s\'étendre à l\'infini. ', 'Shadi ahmani', 'Infini', 37, 1),
(187, 'This painting, composed of white, red, blue, and gray, shows a desert path that seems to stretch into infinity.', 'Sherlock holmes', 'Infinity ', 37, 2),
(188, 'Dieses Gemälde, bestehend aus Weiß, Rot, Blau und Grau, zeigt einen Wüstenweg, der sich scheinbar ins Unendliche erstreckt.', 'Alex schneider', 'Unendlichkeit', 37, 3),
(189, 'این نقاشی که از سفید، قرمز، آبی و خاکستری تشکیل شده است، یک مسیر بیابانی را نشان می‌دهد که به نظر می‌رسد به بی‌پایان دراز شده است.', 'Shadi ahmani', 'بی‌انتها', 37, 4),
(190, '这幅由白色、红色、蓝色和灰色组成的画展示了一条沙漠小径，似乎延伸到无限远处。', 'Huan lee', '无限', 37, 6),
(191, 'Cette peinture à l\'huile est composée en son centre principalement de blanc, avec des couleurs chaudes aux extrémités. Au dernier plan la disposition des couleurs rappelle un ciel à l\'horizon. ', 'Shadi ahmani', 'Éveillé', 38, 1),
(192, 'This oil painting is primarily composed of white in its center, with warm colors at the ends. In the background, the arrangement of colors resembles a horizon sky.', 'Sherlock holmes', 'Awake', 38, 2),
(193, 'Dieses Ölgemälde besteht hauptsächlich aus Weiß in seinem Zentrum, mit warmen Farben an den Enden. Im Hintergrund erinnert die Anordnung der Farben an einen Horizonthimmel.', 'Alex schneider', 'Wach', 38, 3);
INSERT INTO `contenu` (`id_Contenu`, `description_Contenu`, `Auteur_Contenu`, `libelle_contenu`, `Id_oeuvre`, `Id_Langue`) VALUES
(194, 'این نقاشی روغنی در اصل از رنگ سفید در مرکز آن تشکیل شده است، با رنگ‌های گرم در انتهاها. در پس‌زمینه، ترتیب رنگ‌ها به یاد یک آسمان افقی می‌آورد.', 'Shadi ahmani', 'بیدار', 38, 4),
(195, '这幅油画主要由白色组成，中心是白色，两端是温暖的颜色。在背景中，颜色的排列形式像是地平线上的天空。\r\n', 'Huan lee', '清醒的', 38, 6),
(196, 'Principalement composé de blanc, marron et bleu, cette peinture montre au premier plan une branche de fleurs blanches devant ce qui semble être un point d\'eau avec au dernier blanc des formes hautes représentant de la pierre. \r\n', 'Shadi ahmani', 'Pierre, Feuille, Terre ', 39, 1),
(197, 'Mainly composed of white, brown, and blue, this painting shows in the foreground a branch of white flowers in front of what appears to be a water point with white high shapes representing stone in the background.', 'Sherlock holmes', 'Stone, Leaf, Earth', 39, 2),
(198, 'Hauptsächlich aus Weiß, Braun und Blau zusammengesetzt, zeigt dieses Gemälde im Vordergrund einen Ast weißer Blumen vor dem, was wie ein Wasserpunkt mit weißen hohen Formen aussieht, die Stein darstellen.\r\n', 'Alex schneider', 'Stein, Blatt, Erde', 39, 3),
(199, 'اصلی‌ترین بخش‌های این نقاشی از رنگ‌های سفید، قهوه‌ای و آبی تشکیل شده‌است و در پیش‌زمینه، یک شاخه از گل‌های سفید در جلوی آنچه به نظر می‌رسد یک نقطه آب است با اشکال بلند سفید در پشت‌زمینه که نشان دهنده سنگ است.', 'Shadi ahmani', 'سنگ، برگ، خاک', 39, 4),
(200, '\r\n主要由白色、棕色和蓝色组成，这幅画在前景中展示了一根白色花朵的枝条，前面是一个看似水点，而在后面的白色高处形成了石头的形状。', 'Shadi ahmani', '石头，叶子，土', 39, 6),
(201, 'La perspective dans cette peinture à l\'huile surréaliste semble montrer un chemin vers l\'horizon particulièrement illuminé et entouré de formes hautes s\'assimilant à des roches. ', 'Shadi ahmani', 'Stupeur de la plaine ', 40, 1),
(202, 'The perspective in this surrealistic oil painting seems to show a path towards the particularly illuminated horizon, surrounded by tall shapes resembling rocks.', 'Sherlock holmes', 'Stupor of the plain', 40, 2),
(203, 'Die Perspektive in diesem surrealistischen Ölgemälde scheint einen Weg zum besonders beleuchteten Horizont zu zeigen, umgeben von hohen Formen, die an Felsen erinnern.', 'Alex schneider', 'Staunen der Ebene ', 40, 3),
(204, 'چشم‌انداز در این نقاشی روغنی سوررئالیستی به نظر می‌رسد یک مسیر به سوی افق ویژه تابان و احاطه شده توسط اشکال بلندی که به صخره ها شباهت دارند نشان می‌دهد.', 'Shadi ahmani', 'حالت حیرت آور دشت ', 40, 4),
(205, '这幅超现实主义的油画中的透视似乎显示出一条通向特别明亮的地平线的路径，周围环绕着高大的形状，类似于岩石。', 'Huan lee', '平原的恍惚', 40, 6),
(206, 'Cette sculpture en bronze représente la figure emblématique du travail de Parviz Tanavoli. ', 'Shadi ahmani', 'Heech', 41, 1),
(207, 'This bronze sculpture represents the iconic figure of Parviz Tanavoli\'s work.', 'Sherlock holmes', 'Heech', 41, 2),
(208, 'Diese Bronzeskulptur repräsentiert die ikonische Figur von Parviz Tanavolis Arbeit.', 'Alex schneider', 'Heech', 41, 3),
(209, '\"این مجسمه برنزی نمادین کار پرویز تناولی را نشان می‌دهد', 'Shadi ahmani', '\r\nهیچ', 41, 4),
(210, '这座青铜雕塑代表了帕尔维兹·塔纳沃利（Parviz Tanavoli）作品中的标志性人物', 'Huan lee', '缰绳', 41, 6),
(211, 'Sur cette sculpture on aperçoit la forme signature du travail de Tanavoli. Les deux formes s\'enlacent comme deux amants.', 'Shadi ahmani', 'Heech', 42, 1),
(212, 'On this sculpture, we can see the signature shape of Tanavoli\'s work. The two forms intertwine like two lovers.', 'Sherlock holmes', 'Heech', 42, 2),
(213, 'Auf dieser Skulptur sehen wir die charakteristische Form von Tanavolis Arbeit. Die beiden Formen verschmelzen wie zwei Liebende.', 'Alex schneider', 'Heech', 42, 3),
(214, 'در این مجسمه، می‌توانیم شکل امضای کار تناولی را ببینیم. دو شکل مثل دو عاشق به هم پیوسته‌اند', 'Shadi ahmani', 'هیچ', 42, 4),
(215, '在这座雕塑上，我们可以看到塔纳沃利（Tanavoli）作品的标志性形状。这两个形状交织在一起，就像两个恋人一样。', 'Huan lee', '缰绳', 42, 6),
(216, 'Cette sculpture représente une chaise aux angles droits sur laquelle repose la forme signature de Tanavoli. ', 'Shadi ahmani', 'Heech', 43, 1),
(217, 'This sculpture depicts a chair with right angles on which rests Tanavoli\'s signature form.', 'Sherlock holmes', 'Heech', 43, 2),
(218, 'Diese Skulptur zeigt einen Stuhl mit rechten Winkeln, auf dem Tanavolis charakteristische Form ruht.', 'Alex schneider', 'Heech', 43, 3),
(219, 'این مجسمه یک صندلی با زوایا درست را نشان می‌دهد که شکل امضای تناولی روی آن استراحت کرده است.', 'Shadi ahmani', 'هیچ', 43, 4),
(220, '这座雕塑描绘了一个带有直角的椅子，其上放置着塔纳沃利的标志性形态', 'Huan lee', '缰绳', 43, 6),
(221, 'Cette sculpture montre la forme de Tanavoli à moitié emprisonné dans une cage.', 'Shadi ahmani', 'Heech', 44, 1),
(222, 'This sculpture depicts Tanavoli\'s form half-enclosed in a cage.', 'Sherlock holmes', 'Heech', 44, 2),
(223, 'Diese Skulptur zeigt die Form von Tanavoli, die zur Hälfte in einem Käfig eingeschlossen ist.', 'Alex schneider', 'Heech', 44, 3),
(224, 'این مجسمه شکل تناولی را نشان می‌دهد که در نیمی از آن درون قفس گرفتار شده است.', 'Shadi ahmani', 'هیچ', 44, 4),
(225, '这座雕塑展示了塔纳沃利的形象，一半被囚禁在笼子里。', 'Huan lee', '缰绳', 44, 6),
(226, 'La forme de Tanavoli est ici représenté tordue et recourbée sur elle-même.', 'Shadi ahmani', 'Heech', 45, 1),
(227, 'Tanavoli\'s form is depicted here twisted and curved upon itself.', 'Sherlock holmes', 'Heech', 45, 2),
(228, 'Tanavolis Form ist hier verdreht und auf sich selbst gebogen dargestellt.', 'Alex schneider', 'Heech', 45, 3),
(229, 'شکل تناولی در اینجا به صورت خمیده و منحنی بر روی خودش نمایش داده شده است.', 'Shadi ahmani', 'هیچ', 45, 4),
(230, '这里描绘了塔纳沃利的形态扭曲并弯曲在自身上。', 'Huan lee', '缰绳', 45, 6),
(231, 'Sur cette peinture nous apercevons deux personnages. Au premier plan nous apercevons une femme blonde allongée dans un lit, sous les draps blancs. Elle porte sa main gauche contre sa joue. A l\'arrière plan, nous percevons le deuxième personnage, un homme, vêtue de vêtements sombre et semblant se trouver dans un coin d\'ombre. Il regarde la femme qui est dans le lit. En fond nous apercevons une façade d\'immeuble, avec des fenêtres et des volets.', 'Shadi ahmani', '1954 Hotel Bedroom', 46, 1),
(232, 'In this painting, we see two characters. In the foreground, we see a blonde woman lying in a bed, under white sheets. She rests her left hand against her cheek. In the background, we perceive the second character, a man, dressed in dark clothing and seeming to be in a shadowy corner. He is looking at the woman who is in bed. In the background, we see a building facade, with windows and shutters.', 'Sherlock holmes', '1954 Hotel Bedroom', 46, 2),
(233, 'Auf diesem Gemälde sehen wir zwei Personen. Im Vordergrund sehen wir eine blonde Frau, die in einem Bett liegt, unter weißen Laken. Sie stützt ihre linke Hand an ihre Wange. Im Hintergrund erkennen wir die zweite Person, einen Mann, gekleidet in dunkler Kleidung und anscheinend in einer schattigen Ecke. Er schaut auf die Frau, die im Bett liegt. Im Hintergrund sehen wir eine Gebäudefassade mit Fenstern und Jalousien.', 'Alex schneider', '1954 Hotel Schlafzimmer', 46, 3),
(234, 'در این تابلو، دو شخصیت مشاهده می‌شود. در نزدیکی دید ما، یک زن بلوند در تخت خواب دراز کشیده است، زیر پتوهای سفید. او دست چپ خود را به گونه‌اش استوار کرده است. در پس زمینه، ما شخصیت دوم را می‌بینیم، یک مرد، با لباس‌های تاریک و به نظر می‌رسد در گوشه‌ای سایه‌دار است. او به زنی که در تخت خواب است نگاه می‌کند. در پس زمینه، ما یک نمای ساختمان با پنجره‌ها و کرکره‌ها می‌بینیم.', 'Shadi ahmani', 'اتاق هتل ۱۹۵۴', 46, 4),
(235, '在这幅画中，我们看到两个人物。在前景中，我们看到一个金发女子躺在床上，白色床单下。她把左手放在脸颊上。在背景中，我们看到第二个人物，一个男子，穿着深色衣服，似乎站在阴暗的角落。他看着躺在床上的女人。背景中，我们看到一个建筑物的立面，有窗户和百叶窗。', 'Huan lee', '1954年酒店卧室', 46, 6),
(236, 'Cette peinture représente un homme blond portant un costume gris accroupi sur une chaise en bois. Sur un fond de tons de vert, nous voyons au plan intermédiaire, une trainée horizontale de couleur blanche, traversant la largeur du tableau. ', 'Shadi ahmani', 'Homme sur une chaise', 47, 1),
(237, 'This painting depicts a blond man wearing a gray suit crouching on a wooden chair. Against a background of green tones, we see in the middle ground a horizontal streak of white color, crossing the width of the painting.', 'Sherlock holmes', 'Red haired man on a chair', 47, 2),
(238, 'Dieses Gemälde zeigt einen blonden Mann in einem grauen Anzug, der auf einem Holzstuhl hockt. Vor einem Hintergrund aus grünen Tönen sehen wir im Mittelgrund einen horizontalen Streifen aus weißer Farbe, der die Breite des Gemäldes kreuzt.', 'Alex schneider', 'Roter Mann auf einem Stuhl', 47, 3),
(239, 'این نقاشی مردی با موهای بلوند را که لباس خاکستری می‌پوشد و روی یک صندلی چوبی نشسته است را به تصویر می‌کشد. در برابر یک پس زمینه از رنگ سبز، ما در میانه دیداریم که یک خط افقی از رنگ سفید را که عرض نقاشی را می‌گذراند، می‌بینیم.\r\n', 'Shadi ahmani', 'مرد قرمز موی روی صندلی ', 47, 4),
(240, '这幅画描绘了一位金发男子穿着灰色西装蹲在木椅上。在绿色调的背景下，我们在中间看到一条白色的水平条纹，横穿画面的宽度。\r\n', 'Huan lee', '年椅子上的红发男子\r\n', 47, 6),
(241, 'Cette peinture montre une femme vêtue d\'une robe de chambre bleue, pieds nus, elle est de dos et recroquevillée sur un matelas beige. \r\n\r\n', 'Shadi ahmani', 'Sieste d\'Annabelle', 48, 1),
(242, 'This painting depicts a woman wearing a blue dressing gown, barefoot, she is seen from behind and curled up on a beige mattress.', 'Sherlock holmes', 'Annabel Sleeping', 48, 2),
(243, '\r\nDieses Gemälde zeigt eine Frau in einem blauen Morgenmantel, barfuß, von hinten zu sehen und auf einer beigen Matratze zusammengerollt.\r\n', 'Alex schneider', 'Annabel schlafend', 48, 3),
(244, 'این نقاشی زنی را در حالی که لباس شب آبی پوشیده است، برهنه پا، از پشت و روی یک تشک بژ نشسته می‌نشاند.', 'Shadi ahmani', ' آنابل خوابیده ', 48, 4),
(245, '这幅画描绘了一位穿着蓝色睡袍的女人，赤脚，从背后看，蜷缩在米色床垫上。', 'Huan lee', '年安娜贝尔睡着了', 48, 6),
(246, 'Sur cette peinture nous voyons le portrait d\'une femme brune, complètement de face. Devant elle sur une table se trouve une tulipe rouge, que l\'on voit au premier plan. La peinture semble être craquelée.\r\n', 'Shadi ahmani', 'Femme avec une tulipe', 49, 1),
(247, 'In this painting, we see the portrait of a brunette woman, facing completely forward. In front of her on a table is a red tulip, which is seen in the foreground. The painting appears to be cracked.', 'Sherlock holmes', 'Woman with a Tulip', 49, 2),
(248, 'Auf diesem Gemälde sehen wir das Porträt einer brünetten Frau, die vollständig frontal ist. Vor ihr auf einem Tisch befindet sich eine rote Tulpe, die im Vordergrund zu sehen ist. Das Gemälde scheint gerissen zu sein.', 'Alex schneider', 'Frau mit einer Tulpe', 49, 3),
(249, 'در این نقاشی، تصویر یک زن کم‌رنگ را که کاملاً به رو به رو است می‌بینیم. در جلوی او روی یک میز یک لاله قرمز است که در وحله اول دیده می‌شود. نقاشی به نظر می‌رسد ترک خورده است.', 'Shadi ahmani', 'زنی با یک لاله', 49, 4),
(250, '在这幅画中，我们看到了一个黑发女人的肖像，完全面向前方。在她面前的桌子上放着一朵红色的郁金香，可以在前景中看到。这幅画似乎出现了裂缝。', 'Huan lee', '1945年带郁金香的女人', 49, 6),
(251, 'Nous apercevons ici le portrait d\'un jeune garçon portant un short noir, une veste de costume, une chemise bleue et une cravate rouge. Autour de lui on aperçoit des tableaux représentant des individus. Au premier plan on aperçoit un jeune personnage ressemblant beaucoup au personnage principal.\r\n\r\n', 'Shadi ahmani', 'village de garçon', 50, 1),
(252, 'Here we see the portrait of a young boy wearing black shorts, a suit jacket, a blue shirt, and a red tie. Around him, we can see paintings depicting individuals. In the foreground, we see a young character resembling the main character.\r\n', 'Sherlock holmes', 'The Village Boys ', 50, 2),
(253, 'Hier sehen wir das Porträt eines Jungen, der schwarze Shorts, eine Anzugjacke, ein blaues Hemd und eine rote Krawatte trägt. Um ihn herum sehen wir Gemälde, die Einzelpersonen darstellen. Im Vordergrund sehen wir eine junge Figur, die dem Hauptcharakter ähnelt.\r\n', 'Alex schneider', 'Die Dorfjungen \r\n', 50, 3),
(254, 'در اینجا تصویر پسر جوانی که شورت سیاه، یک چاکت دسته، یک پیراهن آبی و یک کراوات قرمز می‌پوشد را می‌بینیم. اطراف او، تابلوهایی را می‌بینیم که افراد را نشان می‌دهند. در برنامه اول، یک شخصیت جوان را می‌بینیم که بسیار به شخصیت اصلی شبیه است.', 'Shadi ahmani', 'پسران روستا ', 50, 4),
(255, '在这里，我们看到了一个穿着黑色短裤、西装外套、蓝色衬衫和红色领带的年轻男孩的肖像。在他周围，我们可以看到描绘个人的绘画。在前景中，我们看到一个年轻的角色，与主要角色相似。\r\n', 'Shadi ahmani', '年的村庄男孩\r\n', 50, 6),
(256, 'Cette peinture illustre une caissette en bois contenant des pommes vertes. Nous apercevons en arrière plan des montagnes rocheuses, avec une petite maison à leur pied. Les couleurs dominantes ici sont le vert, le marron, le jaune, et le rouge. \r\n', 'Shadi ahmani', 'Box of apple in wales', 51, 1),
(257, 'This painting depicts a wooden crate containing green apples. In the background, we see rocky mountains with a small house at their base. The dominant colors here are green, brown, yellow, and red.', 'Sherlock holmes', 'Box of Apples in Wales ', 51, 2),
(258, 'Dieses Gemälde zeigt eine Holzkiste mit grünen Äpfeln. Im Hintergrund sehen wir felsige Berge mit einem kleinen Haus zu ihren Füßen. Die dominierenden Farben hier sind grün, braun, gelb und rot.', 'Alex schneider', 'Apfelkiste in Wales', 51, 3),
(259, 'این نقاشی یک جعبه چوبی حاوی سیب‌های سبز را نشان می‌دهد. در پس زمینه، کوه‌های سنگی با یک خانه کوچک در پای خود را می‌بینیم. رنگ‌های غالب اینجا سبز، قهوه‌ای، زرد و قرمز هستند.', 'Shadi ahmani', 'جعبه سیب در ولز ', 51, 4),
(260, '这幅画描绘了一个装有青苹果的木箱。在背景中，我们看到有小房子的岩石山。这里的主导颜色是绿色、棕色、黄色和红色。', 'Huan lee', '年威尔士的苹果箱', 51, 6),
(261, 'Ce tableau montre sur un fond bleu le haut d\'une chaise en bois sur laquelle est posée un vase transparent contenant cinq jonquilles. \r\n', 'Shadi ahmani', 'Jonquille', 52, 1),
(262, 'This painting depicts, against a blue background, the top of a wooden chair on which sits a transparent vase containing five daffodils.', 'Sherlock holmes', ' Daffodils and Celery\r\n', 52, 2),
(263, 'Dieses Gemälde zeigt vor einem blauen Hintergrund die Oberseite eines Holzstuhls, auf dem eine transparente Vase mit fünf Narzissen steht.\r\n', 'Alex schneider', 'Narzissen und Sellerie ', 52, 3),
(264, 'این نقاشی، در برابر یک پس زمینه آبی، بالای یک صندلی چوبی را نشان می‌دهد که روی آن یک گلدان شفاف حاوی پنج عدد نرگس قرار دارد.', 'Shadi ahmani', ' نرگس و کرفس ', 52, 4),
(265, '这幅画描绘了一个蓝色背景下，一个木制椅子的顶部，上面放着一个透明花瓶，里面装有五朵水仙花。', 'Huan lee', '水仙花和芹菜\r\n', 52, 6),
(266, 'Cette peinture représente le portrait d\'une femme au cheveux brun, avec le regard au loin. Elle est habillée d\'une chemise bleu ciel et serre le coup d\'un chat rayé dans sa main droite.\r\n', 'Shadi ahmani', 'Fille avec un chaton', 53, 1),
(267, 'This painting depicts the portrait of a woman with brown hair, looking into the distance. She is dressed in a light blue shirt and holds the neck of a striped cat in her right hand.\r\n', 'Sherlock holmes', 'Girl with a Kitten', 53, 2),
(268, 'Dieses Gemälde zeigt das Porträt einer Frau mit braunen Haaren, die in die Ferne blickt. Sie trägt ein hellblaues Hemd und hält den Hals einer gestreiften Katze in ihrer rechten Hand.\r\n', 'Alex schneider', 'Mädchen mit Kätzchen ', 53, 3),
(269, 'این نقاشی تصویر یک زن با موهای قهوه‌ای را که به دورش نگاه می‌کند نشان می‌دهد. او با یک پیراهن آبی روشن لباس پوشیده است و گردن یک گربه کوچک را در دست راستش نگه می‌دارد.', 'Shadi ahmani', 'ختر با گربه کوچک ', 53, 4),
(270, '这幅画描绘了一个拥有棕色头发的女人的肖像，她的目光望向远方。她穿着一件浅蓝色的衬衫，右手握着一只有条纹的猫的脖子。\r\n', 'Huan lee', '年的女孩和小猫\r\n', 53, 6),
(271, 'Nous apercevons sur cette peinture une femme blonde en gros plan. Nous ne voyons pas son regard car elle a la tête baissé vers le sol. Elle s\'appuie sur son bras gauche. \r\n', 'Shadi ahmani', 'Fille qui lit', 54, 1),
(272, 'In this painting, we see a close-up of a blonde woman. We do not see her gaze as she has her head lowered towards the ground. She is leaning on her left arm.\r\n', 'Sherlock holmes', 'Girl Reading \r\n', 54, 2),
(273, 'Auf diesem Gemälde sehen wir eine Nahaufnahme einer blonden Frau. Wir sehen ihren Blick nicht, da sie den Kopf gesenkt hat und zum Boden schaut. Sie lehnt sich auf ihren linken Arm.\r\n', 'Alex schneider\r\n', 'Lesendes Mädchen \r\n', 54, 3),
(274, 'در این نقاشی، یک زن بلوند را در نزدیک‌بینی می‌بینیم. چشمان او را نمی‌بینیم زیرا سرش به سمت زمین خم شده است. او روی بازوی چپش حمایت می‌کند.', 'Shadi ahmani', 'دختری کتاب می‌خواند ', 54, 4),
(275, '在这幅画中，我们看到一个金发女子的特写。我们看不到她的目光，因为她的头低垂向地面。她靠在左臂上。\r\n', 'Huan lee', '年读书的女孩\r\n', 54, 6),
(276, 'Cette peinture représente une vieille dame allongée sur un lit. Ses bras sont levés et posés à côté de son visage.\r\n\r\n', 'Shadi ahmani', 'La mère du peintre au repos', 55, 1),
(277, 'This painting depicts an elderly woman lying on a bed. Her arms are raised and placed beside her face.\r\n', 'Sherlock holmes', 'The Painter\'s Mother Resting \r\n', 55, 2),
(278, 'Dieses Gemälde zeigt eine ältere Dame, die auf einem Bett liegt. Ihre Arme sind erhoben und neben ihrem Gesicht platziert.\r\n', 'Alex schneider', 'Die ruhende Mutter des Malers \r\n', 55, 3),
(279, 'این نقاشی یک زن پیر را که در روی یک تخت دراز کشیده است نشان می‌دهد. بازوهایش بالا بلند شده و کنار چهره‌اش قرار داده شده‌اند.', 'Shadi ahmadi', 'مادر نقاش در حال استراحت ', 55, 4),
(280, '这幅画描绘了一位年长的女士躺在床上。她的手臂被举起，放在她的脸旁边。 \r\n', 'Huan lee', '年画家母亲休息\r\n', 55, 6),
(281, 'Cette peinture représente une rose rouge se tenant debout parfaitement, à son pied se trouve une feuille. Le fond est de ton bleu, noir et blanc. ', 'Shadi ahmadi', 'Rose', 56, 1),
(282, 'This painting depicts a perfectly upright red rose, with a leaf at its base. The background is in shades of blue, black, and white.\r\n', 'Sherlock holmes', 'Rose', 56, 2),
(283, 'Dieses Gemälde zeigt eine perfekt aufrechte rote Rose, zu ihren Füßen befindet sich ein Blatt. Der Hintergrund ist in Blau-, Schwarz- und Weißtönen gehalten.\r\n', 'Alex schneider', 'Rose und Wicken', 56, 3),
(284, 'این نقاشی یک گل رز قرمز به صورت کاملاً عمودی نشسته، با یک برگ در پایش را نشان می‌دهد. پس‌زمینه این نقاشی از رنگ‌های آبی، سیاه و سفید است.', 'Shadi ahmadi', ' گل و آبگوشت ', 56, 4),
(285, '这幅画描绘了一朵完美挺立的红玫瑰，底部有一片叶子。背景色是蓝色、黑色和白色的。\r\n', 'Huan lee', '年的玫瑰和豌豆藤', 56, 6),
(286, 'Cette peinture montre ici le portrait d\'une femme assise sur un fauteuil. Elle est vêtue de noir, dont un pull aux rayures vertes. Elle regarde au loin, tenant une rose dans sa main droite. Nous apercevons la tête d\'une rose posé sur ses jambes. Le fond de la peinture est principalement composé de tons jaune et vert. \r\n', 'Shadi ahmadi', 'Roses', 57, 1),
(287, 'This painting shows the portrait of a woman sitting on an armchair. She is dressed in black, including a sweater with green stripes. She is looking into the distance, holding a rose in her right hand. We can see the head of a rose placed on her lap. The background of the painting is mainly composed of yellow and green tones.\r\n\r\n', 'Sherlock holmes', 'Girl with Roses \r\n', 57, 2),
(288, 'Dieses Gemälde zeigt das Porträt einer Frau, die auf einem Sessel sitzt. Sie ist schwarz gekleidet, einschließlich eines Pullovers mit grünen Streifen. Sie schaut in die Ferne und hält eine Rose in ihrer rechten Hand. Wir sehen den Kopf einer Rose, der auf ihrem Schoß liegt. Der Hintergrund des Gemäldes besteht hauptsächlich aus gelben und grünen Tönen.\r\n', 'Alex schneider', 'Mädchen mit Rosen \r\n', 57, 3),
(289, 'این نقاشی نشان دهنده نقاشی تصویری از یک زنی است که بر روی یک صندلی نشسته است. او لباس‌های سیاهی پوشیده است، شامل یک سویشرت با خطوط سبز. او به دور و بر نگاه می‌کند، یک گل را در دست راستش نگه می‌دارد. ما سر یک گل را که بر روی زانوهایش قرار گرفته است می‌بینیم. پس‌زمینه این نقاشی اصولاً از تنوع رنگ‌های زرد و سبز تشکیل شده است.', 'Shadi ahmadi', 'دختر با گلها ', 57, 4),
(290, '这幅画展示了一个坐在扶手椅上的女人的肖像。她穿着黑色衣服，包括一件带有绿色条纹的毛衣。她目视远方，右手拿着一朵玫瑰。我们可以看到一朵玫瑰的头放在她的膝盖上。这幅画的背景主要由黄色和绿色色调组成。\r\n', 'Huan lee', '年的玫瑰女孩\r\n', 57, 6),
(291, 'Cette peinture montre en gros plan une boite semblant être faite de carton, remplie de fraise. On aperçoit au premier plan la feuille d\'un plan de fraise. \r\n', 'Shadi ahmadi', 'Fraises', 58, 1),
(292, 'This painting depicts a close-up of a box, seemingly made of cardboard, filled with strawberries. In the foreground, we can see a strawberry plant leaf.\r\n', 'Sherlock holmes', 'Strawberries', 58, 2),
(293, 'Dieses Gemälde zeigt eine Nahaufnahme einer Schachtel, die anscheinend aus Karton besteht und mit Erdbeeren gefüllt ist. Im Vordergrund ist ein Blatt einer Erdbeerpflanze zu sehen.\r\n', 'Alex schneider', 'Erdbeeren\r\n', 58, 3),
(294, 'این نقاشی نمایشی نزدیک از یک جعبه را نشان می‌دهد که به نظر می‌رسد از کارتن ساخته شده است و پر از توت‌فرنگی است. در پیش‌زمینه، می‌توانیم یک برگ گیاه توت‌فرنگی ببینیم.', 'Shadi ahmadi', 'توت فرنگی‌ها', 58, 4),
(295, '这幅画描绘了一个近景，一个似乎是由纸板制成的盒子，里面装满了草莓。在前景中，我们可以看到一个草莓植物的叶子。\r\n', 'Huan lee', '年草莓\r\n', 58, 6),
(296, 'Cette peinture représente un nourrisson habillé d\'une robe blanche sur un fond abstrait avec des dominantes de vert et noir. \r\n', 'Shadi ahmadi', 'Bébé sur un canapé vert', 59, 1),
(297, 'This painting depicts an infant dressed in a white gown against an abstract background dominated by shades of green and black.\r\n', 'Sherlock Holmes', 'Baby On a Green Sofa\r\n', 59, 2),
(298, 'Dieses Gemälde zeigt ein Baby, das in einem weißen Kleid auf einem abstrakten Hintergrund mit dominierenden Grüntönen und Schwarz dargestellt ist.\r\n\r\n', 'Alex schneider', 'Baby auf einem grünen Sofa\r\n', 59, 3),
(299, 'این نقاشی نمایشی نوزادی که با لباس سفید بر روی یک پس‌زمینه انتزاعی با غالبیت رنگ‌های سبز و سیاه نشان داده شده است.', 'Shadi ahmadi', 'نوزاد در روی مبل سبز', 59, 4),
(300, '这幅画描绘了一个穿着白色礼服的婴儿，背景是抽象的，以绿色和黑色为主导。\r\n', 'Huan lee', '绿色沙发上的婴儿\r\n', 59, 6),
(301, 'Girl in Bed est le portrait d\'une jeune femme blonde aux yeux bleus et aux cheveux longs, allongée dans un lit aux draps blancs, et appuyant sa tête sur sa main droite. \r\n', 'Shadi ahmadi', 'Fille dans un lit', 60, 1),
(302, 'Girl in Bed is the portrait of a young woman with blonde hair and blue eyes, lying in a bed with white sheets, and resting her head on her right hand.\r\n', 'Sherlock holmes', 'Girl in Bed\r\n\r\n', 60, 2),
(303, 'Mädchen im Bett ist das Porträt einer jungen Frau mit blonden Haaren und blauen Augen, die in einem Bett mit weißen Laken liegt und ihren Kopf auf ihre rechte Hand stützt.\r\n', 'Alex schneider', 'Mädchen im Bett\r\n', 60, 3),
(304, 'دختر در تخت، تصویری از یک دختر جوان با موهای بلوند و چشمان آبی است که در یک تخت با رختخواب‌های سفید دراز کشیده و سر خود را بر دست راستش استراحت داده است.', 'Shadi ahmadi', 'دختر در تخت', 60, 4),
(305, '床上的女孩是一个金发蓝眼的年轻女子的肖像，她躺在铺着白色床单的床上，把头靠在右手上。\r\n\r\n', 'Huan lee', '床上的女孩\r\n\r\n', 60, 6),
(306, 'Nous pouvons voir ici le portrait d\'une jeune femme brune, vêtue d\'un vêtement blanc dentelé, sur un fond uni dans les tons beige et jaune. \r\n ', 'Shadi ahmadi', 'Fille en robe blanche', 60, 1),
(307, 'Here we can see the portrait of a young brunette woman, dressed in a white lace garment, against a plain background in beige and yellow tones.\r\n', 'Sherlock holmes', 'Girl in a White Dress\r\n', 61, 2),
(308, 'Hier sehen wir das Porträt einer jungen brünetten Frau, die ein weißes Spitzenkleid trägt, vor einem einfarbigen Hintergrund in Beige- und Gelbtönen.\r\n', 'Alex schneider', 'Mädchen in einem weißen Kleid\r\n', 61, 3),
(309, 'ما می‌توانیم در اینجا تصویر یک دختر جوان مشکی‌مو را که با لباسی سفید و دانتل پوشیده شده است، روی پس‌زمینه‌ای یکنواخت با رنگ‌های بژ و زرد ببینیم.', 'Shadi ahmadi', 'دختری در لباس سفید', 61, 4),
(310, '在这里，我们可以看到一个年轻的黑发女子的肖像，穿着一件白色的蕾丝连衣裙，背景是单一的，色调为米黄和黄色。\r\n', 'Huan lee', '白色连衣裙的女孩\r\n', 61, 6),
(311, 'Nous apercevons ici le portrait d\'une jeune femme brune tenant dans sa main gauche et près de son visage, un petit chien en peluche blanc. Le fond de la scène est composé principalement de vert, représentant de la nature et du végétal. \r\n', 'Shadi ahmadi', 'Enfant avec jouet pour chien', 62, 1),
(312, 'Here we can see the portrait of a young brunette woman holding in her left hand, near her face, a small white stuffed toy dog. The background of the scene is primarily composed of green, representing nature and vegetation.\r\n', 'Sherlock holmes', 'Child with a Toy Dog\r\n', 62, 2),
(313, 'Hier sehen wir das Porträt einer jungen brünetten Frau, die in ihrer linken Hand, nahe ihrem Gesicht, einen kleinen weißen Stoffspielzeughund hält. Der Hintergrund der Szene besteht hauptsächlich aus Grün, was die Natur und Vegetation darstellt.\r\n', 'Alex schneider', 'Kind mit einem Spielzeughund\r\n', 62, 3),
(314, 'ما می‌توانیم در اینجا تصویر یک دختر جوان مشکی‌مو را ببینیم که در دست چپش، نزدیک چهره‌اش، یک سگ‌بازی کوچک سفید نگه می‌دارد. پس‌زمینه صحنه اصولاً از رنگ سبز تشکیل شده است که نمایانگر طبیعت و گیاهان است.', 'Shadi ahmadi', 'کودک با یک سگ‌بازی', 62, 4),
(315, '这里我们可以看到一个年轻的黑发女子的肖像，她用左手靠近脸部抱着一只小白色毛绒玩具狗。场景的背景主要由绿色组成，代表着自然和植物。\r\n', 'Huan lee', '玩具狗的孩子\r\n', 62, 6),
(316, 'Cette peinture représente deux individus, un homme et une femme assis l\'un à côté de l\'autre sur un canapé vert foncé. L\'homme passe son bras sur les épaules de la femme qui le regarde. Le fond de la peinture est sombre principalement, composé de noir avec quelques touches de lumière. ', 'Shadi ahmadi', 'Michael Andrews and June', 63, 1),
(317, 'This painting depicts two individuals, a man and a woman, sitting next to each other on a dark green sofa. The man has his arm around the woman\'s shoulders as she looks at him. The background of the painting is predominantly dark, composed of black with some touches of light.', 'Sherlock holmes', 'Michael Andrews and June', 63, 2),
(318, 'Dieses Gemälde zeigt zwei Personen, einen Mann und eine Frau, die nebeneinander auf einem dunkelgrünen Sofa sitzen. Der Mann hat seinen Arm um die Schultern der Frau gelegt, während sie ihn ansieht. Der Hintergrund des Gemäldes ist überwiegend dunkel, hauptsächlich schwarz mit einigen Lichtakzenten.', 'Alex schneider', 'Michael Andrews and June', 63, 3),
(319, 'این نقاشی دو شخص را نشان می‌دهد، یک مرد و یک زن، که کنار یکدیگر بر روی یک مبل سبز تیره نشسته‌اند. مرد بازوی خود را دور شانه‌های زن گذاشته است در حالی که او به او نگاه می‌کند. پس‌زمینه این نقاشی اغلب تاریک است، از رنگ سیاه با تعدادی لمس‌های نور تشکیل شده است.', 'Shadi ahmadi', 'مایکل اندروز و جون', 63, 4),
(320, '这幅画描绘了两个人，一个男人和一个女人，坐在一张深绿色的沙发上。男人的手臂搭在女人的肩膀上，女人看着他。画的背景主要是黑色，有一些光线点缀。', 'Huan lee', '迈克尔·安德鲁斯和琼', 63, 6),
(321, 'Cette peinture montre un cheval dont nous apercevons uniquement le profil gauche. Ce cheval se tient sur un sol de paille devant un demi-mur en bois, avec à l\'arrière plan, un fond jaune. ', 'Shadi ahmadi', 'pouliche', 64, 1),
(322, 'This painting shows a horse of which we only see the left profile. This horse stands on a straw floor in front of a half-wooden wall, with a yellow background in the background. \r\n', 'Sherlock holmes', 'A filly', 64, 2),
(323, 'Dieses Gemälde zeigt ein Pferd, von dem wir nur das linke Profil sehen. Das Pferd steht auf einem Strohboden vor einer halbholzigen Wand, mit einem gelben Hintergrund im Hintergrund. \r\n', 'Alex schneider', 'Filly', 64, 3),
(324, '\r\nاین نقاشی یک اسب را نشان می‌دهد که تنها نمایی از پروفایل چپ آن را می‌بینیم. این اسب در مقابل یک کف خرما ایستاده است، پشت یک دیوار نیمه چوبی، با پس‌زمینه زرد. ', 'Shadi ahmadi', 'فیلی', 64, 4),
(325, '这幅画展示了一匹马，我们只能看到它的左侧轮廓。这匹马站在一个稻草地板上，前面是一个半木墙，背景是黄色的。', 'Huan lee', '一匹小马 ', 64, 6),
(326, 'La mère du peintre lisant Cette peinture est le portrait d\'une vieille dame aux cheveux blancs, vêtue de vêtements foncés, assise dans un fauteuil, les yeux baissés sur le livre qu\'elle est en train de lire.', 'Shadi ahmadi', 'la mère du peintre lisant', 65, 1),
(327, 'The painter\'s mother reading This painting is the portrait of an old lady with white hair, dressed in dark clothing, sitting in an armchair, her eyes lowered to the book she is reading.', 'Sherlock holmes', 'The painter\'s mother reading', 65, 2),
(328, 'Die Mutter des Malers liest Dieses Gemälde ist das Porträt einer alten Dame mit weißen Haaren, gekleidet in dunkler Kleidung, sitzend in einem Sessel, die Augen gesenkt auf das Buch, das sie liest.', 'Alex schneider', 'Die Mutter des Malers liest', 65, 3),
(329, 'مادر نقاش کتاب می‌خواند این نقاشی نمایش پرتره‌ی یک زن پیر با موهای سفید است، که لباس‌های تاریکی پوشیده و در یک صندلی نشسته، چشمانش را به کتابی که در حال خواندن آن است فرو می‌کند.', 'Shadi ahmadi', 'است', 65, 4),
(330, '画家的母亲在阅读 这幅画是一位白发老太太的肖像，穿着深色衣服，坐在一把扶手椅上，目光投向她正在阅读的书籍。', 'Huan lee', '的书籍。', 65, 6);

-- --------------------------------------------------------

--
-- Structure de la table `dirart`
--

CREATE TABLE `dirart` (
  `id_DirArt` int(11) NOT NULL,
  `nom_DirArt` varchar(100) DEFAULT NULL,
  `prenom_DirArt` varchar(100) DEFAULT NULL,
  `email_DirArt` varchar(100) DEFAULT NULL,
  `tel_DirArt` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `dirart`
--

INSERT INTO `dirart` (`id_DirArt`, `nom_DirArt`, `prenom_DirArt`, `email_DirArt`, `tel_DirArt`) VALUES
(1, 'Golestan', 'Leyli', 'leyli.golestan@gmail.com', '6'),
(2, 'Lou', 'Haniko', 'haniko.lou@gmail.com', '6'),
(3, 'Merkel', 'Susan', 'susan.merkel@gmail.com', '6'),
(4, 'Harrisson', 'James', 'james.harrisson@gmail.com', '6'),
(5, 'France', 'Claude', 'claude.france@gmail.com', '6'),
(6, 'jzefhu', 'lziefdh', 'justine.bouin@gmail.com', '0601020303');

-- --------------------------------------------------------

--
-- Structure de la table `espace`
--

CREATE TABLE `espace` (
  `Id_Espace` int(11) NOT NULL,
  `libelle_Espace` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `espace`
--

INSERT INTO `espace` (`Id_Espace`, `libelle_Espace`) VALUES
(1, 'Hall Principal'),
(2, 'Espace 1'),
(3, 'Espace 2'),
(4, 'Espace 3');

-- --------------------------------------------------------

--
-- Structure de la table `exposition`
--

CREATE TABLE `exposition` (
  `Id_Exposition` int(11) NOT NULL,
  `libelle_Exposition` varchar(255) DEFAULT NULL,
  `Date_Debut` date NOT NULL,
  `Date_Fin` date NOT NULL,
  `Horaires_Debut` time NOT NULL,
  `Horaires_Fin` time NOT NULL,
  `Nbre_Oeuvres` int(11) NOT NULL,
  `chemin_Plan` varchar(150) DEFAULT NULL,
  `chemin_Affiche` varchar(100) DEFAULT NULL,
  `Id_Artiste` int(11) NOT NULL,
  `id_Theme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `exposition`
--

INSERT INTO `exposition` (`Id_Exposition`, `libelle_Exposition`, `Date_Debut`, `Date_Fin`, `Horaires_Debut`, `Horaires_Fin`, `Nbre_Oeuvres`, `chemin_Plan`, `chemin_Affiche`, `Id_Artiste`, `id_Theme`) VALUES
(1, 'Tempête en Iran - Abbas Attar', '2024-01-09', '2024-02-02', '10:00:00', '19:00:00', 10, NULL, 'attar.jpg', 2, 1),
(2, 'Un homme à travers la guerre - Kave Golestan', '2024-01-09', '2024-02-02', '10:00:00', '19:00:00', 10, '', 'golestan.jpg', 18, 1),
(3, 'L\'image d\'une femme en Iran - Shirin Nashat', '2024-01-09', '2024-02-02', '10:00:00', '19:00:00', 10, NULL, 'nashat.jpg', 4, 2),
(4, 'Dans la distance entre deux points - Iran Darroudi', '2024-02-05', '2024-03-01', '10:00:00', '19:00:00', 10, NULL, 'darroudi.jpg', 1, 3),
(5, 'Rien - Parviz Tanavoli', '2024-02-05', '2024-03-01', '10:00:00', '19:00:00', 5, NULL, 'tanavoli.jpg', 10, 4),
(6, 'Cadre de vie - Lucian Freud', '2024-03-04', '2024-03-29', '10:00:00', '19:00:00', 20, NULL, 'cadre-de-vie.jpg', 12, 5),
(7, 'Sombre comme la nuit - Pierre Soulages', '2024-04-01', '2024-04-26', '10:00:00', '19:00:00', 10, NULL, 'soulages.jpg', 24, 5),
(8, 'Un regard nouveau - Bahman Mohasses', '2024-04-01', '2024-04-26', '10:00:00', '19:00:00', 5, NULL, 'mohasess.png', 22, 5),
(9, 'Cafard et géopolitique - Mana Neyestani', '2024-04-29', '2024-05-25', '10:00:00', '19:00:00', 15, NULL, 'Neyestani.jpg', 3, 6),
(10, 'Vent de rebellion à Persepolis - Marjan Satrapi', '2024-04-29', '2024-05-25', '10:00:00', '19:00:00', 10, NULL, 'Satrapi.jpg', 16, 7),
(11, 'Confusion et double nationalité - Riad Sattouf', '2024-04-29', '2024-05-25', '10:00:00', '00:00:19', 10, NULL, 'satouf.jpg', 15, 7),
(12, 'Allégorie de la violence -Kara Walker', '2024-05-28', '2024-06-21', '10:00:00', '00:00:19', 10, NULL, 'walker.jpg', 5, 8),
(13, 'Rencontre un sculpteur minimal - Robert Morris', '2024-05-28', '2024-06-21', '10:00:00', '19:00:00', 5, NULL, 'Morris.jpg', 25, 9),
(14, ' Nouvelle rencontre à Yu Chang - Chang Yu', '2024-06-25', '2024-07-19', '10:00:00', '19:00:00', 15, NULL, 'yu.jpg', 6, 5),
(15, 'A la mémoire de Zao - Wou-Ki Zao', '2024-06-25', '2024-07-19', '10:00:00', '19:00:00', 5, NULL, 'wou-ki.png', 7, 5),
(16, 'Culture Luxe - Richard Orlinski', '2024-07-23', '2024-08-16', '10:00:00', '19:00:00', 5, NULL, 'orlinski.jpg', 9, 4),
(17, 'Art et nature - Pierre-Jean Chabert', '2024-08-20', '2024-09-13', '10:00:00', '19:00:00', 10, NULL, 'chabert.jpg', 11, 4),
(18, 'Joie à travers la couleur - Takashi Murakami', '2024-08-20', '2024-09-13', '10:00:00', '19:00:00', 15, NULL, 'takashi_murakami.jpg', 8, 5),
(19, 'Koons pop - Jeff Koons', '2024-09-17', '2024-10-11', '10:00:00', '19:00:00', 10, NULL, 'jeff_koons.jpg', 13, 11),
(20, 'Redéfinition du noir et blanc - Santiago Sierra', '2024-10-15', '2024-11-08', '10:00:00', '19:00:00', 10, NULL, 'sierra.jpg', 23, 1),
(21, 'Prophétie mélancolique- Guity Novin', '2024-10-15', '2024-11-08', '10:00:00', '19:00:00', 5, NULL, 'novin.png', 19, 5),
(22, 'Les souvenirs de Reza - Reza Deghati', '2024-10-15', '2024-11-08', '10:00:00', '19:00:00', 10, NULL, 'deghati.png', 17, 1),
(23, 'Dialogue interdit - Annette Messager', '2024-11-12', '2024-11-22', '10:00:00', '19:00:00', 5, NULL, 'messager.png', 20, 13),
(24, 'Les frères Petgar - Jafar Petgar', '2024-11-26', '2024-12-20', '10:00:00', '19:00:00', 5, NULL, 'brotherpetgar.jpg', 27, 5),
(25, 'Les frères Petgar -Ali Asghar Petgar', '2024-11-26', '2024-12-20', '10:00:00', '19:00:00', 5, NULL, 'brotherpetgar.jpg', 26, 5);

-- --------------------------------------------------------

--
-- Structure de la table `gérer`
--

CREATE TABLE `gérer` (
  `id_Collaborateur` int(11) NOT NULL,
  `Id_Exposition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id_Image` int(11) NOT NULL,
  `libelle_Image` varchar(50) DEFAULT NULL,
  `chemin_Image` varchar(255) DEFAULT NULL,
  `Id_oeuvre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id_Image`, `libelle_Image`, `chemin_Image`, `Id_oeuvre`) VALUES
(1, 'mollah', 'attar_mollah.jpg', 1),
(2, 'United States Embassy', 'attar_usa_embassy.jpg', 2),
(3, 'money', 'attar_money.jpg', 3),
(4, 'khomeiny', 'attar_khomeiny.jpg', 4),
(5, 'shah', 'attar_shah.jpg', 5),
(6, 'revolution', 'attar_revolution.jpg', 6),
(7, 'fire', 'attar_fire.jpg', 7),
(8, 'shoe', 'attar_shoe.jpg', 8),
(9, 'attar_run', 'attar_run.jpg', 9),
(10, 'hoveyda', 'attar_hoveyda.jpg', 10),
(11, 'soldier', 'golestan_soldier.jpg', 11),
(12, 'water', 'golestan_water.jpg', 12),
(13, 'mullah', 'golestan_mullah.jpg', 13),
(14, 'streetwar', 'golestan_streetwar.jpg', 14),
(15, 'warprisoner', 'golestan_warprisoner.jpg', 15),
(16, 'martyr', 'golestan_martyr.jpg', 16),
(17, 'shah', 'golestan_shah.jpg', 17),
(18, 'streetwar2', 'golestan_streetwar2.jpg', 18),
(19, 'mask', 'golestan_mask.jpg', 19),
(20, 'irakwar', 'golestan_irakwar.jpg', 20),
(21, 'Mains musulmanes et juives', 'neshat_hands.jpg', 21),
(22, 'hand', 'neshat_hand.jpg', 22),
(23, 'rebellioussilence', 'neshat_rebellioussilence.jpg', 23),
(24, 'secret', 'neshat_secret.jpg', 24),
(25, 'aim', 'neshat_aim.jpg', 25),
(26, 'mother', 'neshat_mother.jpg', 26),
(27, 'stripped', 'Neshat-stripped.jpg', 27),
(28, 'unveiling', 'neshat_unveiling.jpg', 28),
(29, 'foot', 'neshat_foot.jpg', 29),
(30, 'martyrdom', 'neshat_martyrdom.jpg', 30),
(31, 'desert', 'darroudi_desert.jpg', 31),
(32, 'growing', 'darroudi_growing.jpg', 32),
(33, 'light', 'darroudi_light.jpg', 33),
(34, 'cold', 'darroudi_cold.jpg', 34),
(35, 'illusion', 'darroudi_illusion.jpg', 35),
(36, 'sun', 'darroudi_sun.jpg', 36),
(37, 'infinity', 'darroudi_infinity.jpg', 37),
(38, 'awake', 'darroudi_awake.jpg', 38),
(39, 'stone', 'darroudi_stone.jpg', 39),
(40, 'stupor', 'darroudi_stupor.jpg', 40),
(41, 'heech', 'tanavoli_heech.jpg', 41),
(42, 'lover', 'tanavoli_lover.jpg', 42),
(43, 'chair', 'tanavoli_chair.jpg', 43),
(44, 'cage', 'tanavoli_cage.jpg', 44),
(45, 'twist', 'tanavoli_twist.jpg', 45),
(46, 'hotel', 'freud_hotel.jpg', 46),
(47, 'man', 'freud_man.jpg', 47),
(48, 'sleep', 'freud_sleep.jpg', 48),
(49, 'tulip', 'freud_tulip.jpg', 49),
(50, 'boy', 'freud_boy.jpg', 50),
(51, 'apple', 'freud_apple.jpg', 51),
(52, 'daffoldis', 'freud_daffodils.jpg', 52),
(53, 'cat', 'freud_cat.jpg', 53),
(54, 'reading', 'freud_reading.jpg', 54),
(55, 'mother', 'freud_mother.jpg', 55),
(56, 'rose', 'freud_rose.jpg', 56),
(57, 'girl', 'freud_girl.jpg', 57),
(58, 'strawberries', 'freud_strawberries.jpg', 58),
(59, 'baby', 'freud_baby.jpg', 59),
(60, 'bed', 'freud_bed.jpg', 60),
(61, 'dress', 'freud_dress.jpg', 61),
(62, 'dog', 'freud_dog.jpg', 62),
(63, 'june', 'freud_june.jpg', 63),
(64, 'filly', 'freud_filly.jpg', 64),
(65, 'grandmother', 'freud_grandmother.jpg', 65),
(66, 'From Midnight to Twilight', 'soulages_art1.jpg', 66),
(67, 'Pluie de clous', 'soulages_art2.jpg', 67),
(68, 'Feu dans la cendre', 'soulages_art3.jpg', 68),
(69, 'Brou de noix', 'soulages_art4.jpg', 69),
(70, 'Lumière et pénombre', 'soulages_art5.jpg', 70),
(71, 'Rayon', 'soulages_art6.jpg', 71),
(72, 'Un fort sentiment', 'soulages_art7.jpg', 72),
(73, 'Encre sur papier', 'soulages_art8.jpg', 73),
(74, 'Outrenoir', 'soulages_art9.jpg', 74),
(75, 'Prisme du noir', 'soulages_art10.jpg', 75),
(76, 'Fish', 'mohassess_fish.jpg', 76),
(77, 'Fish and meal', 'mohassess_fish2.jpg', 77),
(78, 'Grenade', 'mohassess_grenade.jpg', 78),
(79, 'Painter\'s mother', 'mohassess_mother.jpg', 79),
(80, 'Geant vert', 'mohassess_div.jpg', 80);

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

CREATE TABLE `langue` (
  `Id_Langue` int(11) NOT NULL,
  `libelle_Langue` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `langue`
--

INSERT INTO `langue` (`Id_Langue`, `libelle_Langue`) VALUES
(1, 'Français'),
(2, 'English'),
(3, 'Deutsch'),
(4, 'فارسی'),
(6, 'Chinese');

-- --------------------------------------------------------

--
-- Structure de la table `oeuvres`
--

CREATE TABLE `oeuvres` (
  `Id_oeuvre` int(11) NOT NULL,
  `libelle_Oeuvre` varchar(150) NOT NULL,
  `hauteur_Oeuvre` decimal(15,2) DEFAULT NULL,
  `largeur_Oeuvre` decimal(15,2) DEFAULT NULL,
  `profondeur_Oeuvre` decimal(15,2) DEFAULT NULL,
  `poids_Oeuvre` decimal(15,2) DEFAULT NULL,
  `prix` decimal(15,2) DEFAULT NULL,
  `etat_Oeuvre` tinyint(1) DEFAULT NULL,
  `Consultation_Oeuvre` int(11) DEFAULT NULL,
  `Id_Exposition` int(11) NOT NULL,
  `Id_Position` int(11) NOT NULL,
  `Id_Type` int(11) NOT NULL,
  `Id_Artiste` int(11) NOT NULL,
  `chemin_Flashcode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `oeuvres`
--

INSERT INTO `oeuvres` (`Id_oeuvre`, `libelle_Oeuvre`, `hauteur_Oeuvre`, `largeur_Oeuvre`, `profondeur_Oeuvre`, `poids_Oeuvre`, `prix`, `etat_Oeuvre`, `Consultation_Oeuvre`, `Id_Exposition`, `Id_Position`, `Id_Type`, `Id_Artiste`, `chemin_Flashcode`) VALUES
(1, 'mollah', '70.00', '50.00', '5.00', '800.00', '1000.00', 1, 0, 1, 1, 1, 2, ''),
(2, 'United States Embassy', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 1, 1, 1, 2, ''),
(3, 'Money', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 1, 1, 1, 2, ''),
(4, 'Khomeiny', '70.00', '50.00', '5.00', '800.00', '1000.00', 1, 0, 1, 1, 1, 2, ''),
(5, 'Shah', '70.00', '50.00', '5.00', '800.00', '1000.00', 1, 0, 1, 1, 1, 2, ''),
(6, 'Revolution', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 1, 1, 1, 2, ''),
(7, 'Fire', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 1, 1, 1, 2, ''),
(8, 'Shoes', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 1, 1, 1, 2, ''),
(9, 'Run', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 1, 1, 1, 2, ''),
(10, 'Hoveyda', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 1, 1, 1, 2, ''),
(11, 'Soldier', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 2, 2, 1, 18, ''),
(12, 'Water', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 2, 2, 1, 18, ''),
(13, 'Mullah', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 2, 2, 1, 18, ''),
(14, 'Street war', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 2, 2, 1, 18, ''),
(15, 'War prisoner', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 2, 2, 1, 18, ''),
(16, 'Martyr', '70.00', '50.00', '5.00', '800.00', '1000.00', 1, 0, 2, 2, 1, 18, ''),
(17, 'Shah', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 2, 2, 1, 18, ''),
(18, 'Street war 2', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 2, 2, 1, 18, ''),
(19, 'Mask', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 2, 2, 1, 18, ''),
(20, 'Irak War', '50.00', '70.00', '5.00', '800.00', '1000.00', 1, 0, 2, 2, 1, 18, ''),
(21, 'Hands', '18.00', '12.00', '5.00', '800.00', '1000.00', 1, 0, 3, 3, 1, 4, ''),
(22, 'Muslim Hand', '18.00', '12.00', '5.00', '800.00', '1000.00', 1, 0, 3, 3, 1, 4, ''),
(23, 'Rebellious Silence', '18.00', '12.00', '5.00', '800.00', '1000.00', 1, 0, 3, 3, 1, 4, ''),
(24, 'Secret', '18.00', '12.00', '5.00', '800.00', '1000.00', 1, 0, 3, 3, 1, 4, ''),
(25, 'Aim', '18.00', '12.00', '5.00', '800.00', '1000.00', 1, 0, 3, 3, 1, 4, ''),
(26, 'Mother and son', '18.00', '12.00', '5.00', '800.00', '1000.00', 1, 0, 3, 3, 1, 4, ''),
(27, 'Stripped', '18.00', '12.00', '5.00', '800.00', '1000.00', 1, 0, 3, 3, 1, 4, ''),
(28, 'Unveiling', '18.00', '12.00', '5.00', '800.00', '1000.00', 1, 0, 3, 3, 1, 4, ''),
(29, 'Foot', '18.00', '12.00', '5.00', '800.00', '1000.00', 1, 0, 3, 3, 1, 4, ''),
(30, 'Martyr Dom', '18.00', '12.00', '5.00', '800.00', '1000.00', 1, 0, 3, 3, 1, 4, ''),
(31, 'Desert', '135.00', '135.00', '5.00', '800.00', '8000.00', 1, 0, 4, 1, 2, 1, ''),
(32, 'Growing', '140.00', '140.00', '5.00', '800.00', '10000.00', 1, 0, 4, 1, 2, 1, ''),
(33, 'Light', '118.00', '89.00', '5.00', '800.00', '9000.00', 1, 0, 4, 1, 2, 1, ''),
(34, 'Cold', '73.00', '62.00', '5.00', '800.00', '9000.00', 1, 0, 4, 1, 2, 1, ''),
(35, 'Illusion', '56.00', '49.00', '5.00', '800.00', '9000.00', 1, 0, 4, 1, 2, 1, ''),
(36, 'Broken Sun', '130.00', '90.00', '5.00', '800.00', '9000.00', 1, 0, 4, 1, 2, 1, ''),
(37, 'Infinity', '123.00', '92.00', '5.00', '800.00', '9000.00', 1, 0, 4, 1, 2, 1, ''),
(38, 'Awake', '101.00', '60.00', '5.00', '800.00', '9000.00', 1, 0, 4, 1, 2, 1, ''),
(39, 'Stone Leaf Earth', '120.00', '80.00', '5.00', '800.00', '9000.00', 1, 0, 4, 1, 2, 1, ''),
(40, 'Stupor of the pain', '89.00', '118.00', '5.00', '5000.00', '10000.00', 1, 0, 4, 1, 2, 1, ''),
(41, 'Standing Heech', '106.00', '30.00', '25.00', '5000.00', '15000.00', 1, 0, 5, 2, 3, 10, ''),
(42, 'Heech lovers', '180.00', '122.00', '76.00', '5000.00', '60000.00', 1, 0, 5, 2, 3, 10, ''),
(43, 'Heech and chair VI', '18.00', '7.00', '7.00', '2000.00', '60000.00', 1, 0, 5, 2, 3, 10, ''),
(44, 'Heech in the cage', '118.00', '49.00', '42.00', '5000.00', '60000.00', 1, 0, 5, 2, 3, 10, ''),
(45, 'Heech twist', '815.00', '7.00', '6.00', '3000.00', '20000.00', 1, 0, 5, 2, 3, 10, ''),
(46, 'Hotel Bedroom', '70.00', '50.00', '5.00', '800.00', '1000.00', 1, 0, 6, 1, 2, 12, ''),
(47, 'Red Haired on a chair', '92.00', '92.00', '5.00', '800.00', '10000.00', 1, 0, 6, 1, 2, 12, ''),
(48, 'Annabel Sleeping', '39.00', '56.00', '5.00', '500.00', '5000.00', 1, 0, 6, 1, 2, 12, ''),
(49, 'Woman with a tulip', '13.00', '23.00', '5.00', '300.00', '1000.00', 1, 0, 6, 1, 2, 12, ''),
(50, 'The village boys', '41.00', '51.00', '5.00', '300.00', '1000.00', 1, 0, 6, 1, 2, 12, ''),
(51, 'Box of Apples in Wales', '75.00', '60.00', '5.00', '300.00', '1000.00', 1, 0, 6, 2, 2, 12, ''),
(52, 'Daffodils and Celery', '92.00', '92.00', '5.00', '800.00', '10000.00', 1, 0, 6, 2, 2, 12, ''),
(53, 'Girl with a kitten', '30.00', '40.00', '5.00', '300.00', '1000.00', 1, 0, 6, 2, 2, 12, ''),
(54, 'Girl Reading', '16.00', '30.00', '5.00', '300.00', '1000.00', 1, 0, 6, 2, 2, 12, ''),
(55, 'The painter\'s mother resting', '92.00', '92.00', '5.00', '800.00', '10000.00', 1, 0, 6, 2, 2, 12, ''),
(56, 'Rose and Sweet Pea', '92.00', '92.00', '5.00', '800.00', '10000.00', 1, 0, 6, 3, 2, 12, ''),
(57, 'Girl with Roses', '75.00', '106.00', '5.00', '800.00', '12000.00', 1, 0, 6, 3, 2, 12, ''),
(58, 'Strawberries', '13.00', '11.00', '5.00', '800.00', '2000.00', 1, 0, 6, 3, 2, 12, ''),
(59, 'Baby On a green sofa', '17.00', '25.00', '5.00', '300.00', '1000.00', 1, 0, 6, 3, 2, 12, ''),
(60, 'Girl in Bed', '31.00', '46.00', '5.00', '300.00', '1000.00', 1, 0, 6, 3, 2, 12, ''),
(61, 'Girl in a White dress', '48.00', '58.00', '5.00', '300.00', '1000.00', 1, 0, 6, 3, 2, 12, ''),
(62, 'Child with a toy dog', '40.00', '35.00', '5.00', '300.00', '1000.00', 1, 0, 6, 3, 2, 12, ''),
(63, 'Michael Andrews and June', '70.00', '60.00', '5.00', '300.00', '1000.00', 1, 0, 6, 3, 2, 12, ''),
(64, 'A Filly', '27.00', '19.00', '5.00', '300.00', '1000.00', 1, 0, 6, 3, 2, 12, ''),
(65, 'The painter\'s mother reading', '51.00', '66.00', '5.00', '300.00', '1000.00', 1, 0, 6, 3, 2, 12, ''),
(66, 'From Midnight To Twilight', '195.00', '130.00', '5.00', '400.00', '1000.00', 0, 0, 7, 1, 2, 24, ''),
(67, 'Pluie de clous', '130.00', '97.00', '5.00', '400.00', '1000.00', 0, 0, 7, 1, 2, 24, ''),
(68, 'Feu dans la cendre', '81.00', '100.00', '5.00', '400.00', '1000.00', 0, 0, 7, 1, 2, 24, ''),
(69, 'Brou de noix ', '65.00', '50.00', '5.00', '400.00', '1000.00', 0, 0, 7, 1, 2, 24, ''),
(70, 'Lumière et pénombre ', '146.00', '114.00', '5.00', '400.00', '1000.00', 0, 0, 7, 1, 2, 24, ''),
(71, 'Rayon', '202.00', '327.00', '5.00', '400.00', '1000.00', 0, 0, 7, 1, 2, 24, ''),
(72, 'Un fort sentiment ', '260.00', '202.00', '5.00', '400.00', '1000.00', 0, 0, 7, 1, 2, 24, ''),
(73, 'Encre sur papier ', '324.00', '362.00', '5.00', '400.00', '1000.00', 0, 0, 7, 1, 2, 24, ''),
(74, 'Outrenoir', '324.00', '181.00', '5.00', '400.00', '1000.00', 0, 0, 7, 1, 2, 24, ''),
(75, 'Prisme du noir', '222.00', '314.00', '5.00', '400.00', '1000.00', 0, 0, 7, 1, 2, 24, ''),
(76, 'Fish', '45.00', '62.80', '5.00', '400.00', '1000.00', 0, 0, 8, 2, 2, 22, ''),
(77, 'Fish and meal', '45.00', '62.80', '5.00', '400.00', '1000.00', 0, 0, 8, 2, 2, 22, ''),
(78, 'Grenade', '45.00', '62.80', '5.00', '400.00', '1000.00', 0, 0, 8, 2, 2, 22, ''),
(79, 'Painter\'s mother', '90.00', '82.00', '5.00', '400.00', '1000.00', 0, 0, 8, 2, 2, 22, ''),
(80, 'Geant vert', '50.00', '70.00', '5.00', '400.00', '1000.00', 0, 0, 8, 2, 2, 22, '');

-- --------------------------------------------------------

--
-- Structure de la table `position`
--

CREATE TABLE `position` (
  `Id_Position` int(11) NOT NULL,
  `libelle_Position` varchar(100) DEFAULT NULL,
  `Id_Espace` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `position`
--

INSERT INTO `position` (`Id_Position`, `libelle_Position`, `Id_Espace`) VALUES
(1, 'ES3-A-1', 4),
(2, 'ES3-A-2', 4),
(3, 'ES3-A-3', 4),
(4, 'ES3-A-4', 4),
(5, 'ES3-A-5', 4),
(6, 'ES3-A-6', 4),
(7, 'ES3-A-7', 4),
(8, 'ES3-A-8', 4),
(9, 'ES3-A-9', 4),
(10, 'ES3-A-10', 4),
(11, 'ES3-B-1', 4),
(12, 'ES3-B-2', 4),
(13, 'ES3-B-3', 4),
(14, 'ES3-B-4', 4),
(15, 'ES3-B-5', 4),
(16, 'ES3-B-6', 4),
(17, 'ES3-B-7', 4),
(18, 'ES3-B-8', 4),
(19, 'ES3-B-9', 4),
(20, 'ES3-B-10', 4),
(21, 'ES3-C-1', 4),
(22, 'ES3-C-2', 4),
(23, 'ES3-C-3', 4),
(24, 'ES3-C-4', 4),
(25, 'ES3-C-5', 4),
(26, 'ES3-C-6', 4),
(27, 'ES3-C-7', 4),
(28, 'ES3-C-8', 4),
(29, 'ES3-C-9', 4),
(30, 'ES3-C-10', 4),
(31, 'ES3-D-1', 4),
(32, 'ES3-D-2', 4),
(33, 'ES3-D-3', 4),
(34, 'ES3-D-4', 4),
(35, 'ES3-D-5', 4),
(36, 'ES3-D-6', 4),
(37, 'ES3-D-7', 4),
(38, 'ES3-D-8', 4),
(39, 'ES3-D-9', 4),
(40, 'ES3-D-10', 4),
(41, 'ES3-E-1', 4),
(42, 'ES3-E-2', 4),
(43, 'ES3-E-3', 4),
(44, 'ES3-E-4', 4),
(45, 'ES3-E-5', 4),
(46, 'ES3-E-6', 4),
(47, 'ES3-E-7', 4),
(48, 'ES3-E-8', 4),
(49, 'ES3-E-9', 4),
(50, 'ES3-E-10', 4),
(51, 'ES3-F-1', 4),
(52, 'ES3-F-2', 4),
(53, 'ES3-F-3', 4),
(54, 'ES3-F-4', 4),
(55, 'ES3-F-5', 4),
(56, 'ES3-F-6', 4),
(57, 'ES3-F-7', 4),
(58, 'ES3-F-8', 4),
(59, 'ES3-F-9', 4),
(60, 'ES3-F-10', 4),
(61, 'ES3-G-1', 4),
(62, 'ES3-G-2', 4),
(63, 'ES3-G-3', 4),
(64, 'ES3-G-4', 4),
(65, 'ES3-G-5', 4),
(66, 'ES3-G-6', 4),
(67, 'ES3-G-7', 4),
(68, 'ES3-G-8', 4),
(69, 'ES3-G-9', 4),
(70, 'ES3-G-10', 4),
(71, 'ES3-H-1', 4),
(72, 'ES3-H-2', 4),
(73, 'ES3-H-3', 4),
(74, 'ES3-H-4', 4),
(75, 'ES3-H-5', 4),
(76, 'ES3-H-6', 4),
(77, 'ES3-H-7', 4),
(78, 'ES3-H-8', 4),
(79, 'ES3-H-9', 4),
(80, 'ES3-H-10', 4),
(81, 'ES3-I-1', 4),
(82, 'ES3-I-2', 4),
(83, 'ES3-I-3', 4),
(84, 'ES3-I-4', 4),
(85, 'ES3-I-5', 4),
(86, 'ES3-I-6', 4),
(87, 'ES3-I-7', 4),
(88, 'ES3-I-8', 4),
(89, 'ES3-I-9', 4),
(90, 'ES3-I-10', 4),
(91, 'ES3-J-1', 4),
(92, 'ES3-J-2', 4),
(93, 'ES3-J-3', 4),
(94, 'ES3-J-4', 4),
(95, 'ES3-J-5', 4),
(96, 'ES3-J-6', 4),
(97, 'ES3-J-7', 4),
(98, 'ES3-J-8', 4),
(99, 'ES3-J-9', 4),
(100, 'ES3-J-10', 4),
(101, 'ES2-K-1', 3),
(102, 'ES2-K-2', 3),
(103, 'ES2-K-3', 3),
(104, 'ES2-K-4', 3),
(105, 'ES2-K-5', 3),
(106, 'ES2-L-1', 3),
(107, 'ES2-L-2', 3),
(108, 'ES2-L-3', 3),
(109, 'ES2-L-4', 3),
(110, 'ES2-L-5', 3),
(111, 'ES2-M-1', 3),
(112, 'ES2-M-2', 3),
(113, 'ES2-M-3', 3),
(114, 'ES2-M-4', 3),
(115, 'ES2-M-5', 3),
(116, 'ES2-N-1', 3),
(117, 'ES2-N-2', 3),
(118, 'ES2-N-3', 3),
(119, 'ES2-N-4', 3),
(120, 'ES2-N-5', 3),
(121, 'ES2-O-1', 3),
(122, 'ES2-O-2', 3),
(123, 'ES2-O-3', 3),
(124, 'ES2-O-4', 3),
(125, 'ES2-O-5', 3),
(126, 'ES1-K-1', 2),
(127, 'ES1-K-2', 2),
(128, 'ES1-K-3', 2),
(129, 'ES1-K-4', 2),
(130, 'ES1-K-5', 2),
(131, 'ES1-L-1', 2),
(132, 'ES1-L-2', 2),
(133, 'ES1-L-3', 2),
(134, 'ES1-L-4', 2),
(135, 'ES1-L-5', 2),
(136, 'ES1-M-1', 2),
(137, 'ES1-M-2', 2),
(138, 'ES1-M-3', 2),
(139, 'ES1-M-4', 2),
(140, 'ES1-M-5', 2),
(141, 'ES1-N-1', 2),
(142, 'ES1-N-2', 2),
(143, 'ES1-N-3', 2),
(144, 'ES1-N-4', 2),
(145, 'ES1-N-5', 2),
(146, 'ES1-O-1', 2),
(147, 'ES1-O-2', 2),
(148, 'ES1-O-3', 2),
(149, 'ES1-O-4', 2),
(150, 'ES1-O-5', 2);

-- --------------------------------------------------------

--
-- Structure de la table `préparer`
--

CREATE TABLE `préparer` (
  `id_Collaborateur` int(11) NOT NULL,
  `id_Contenu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `présenter_3`
--

CREATE TABLE `présenter_3` (
  `Id_Langue` int(11) NOT NULL,
  `id_Audio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `présenter_4`
--

CREATE TABLE `présenter_4` (
  `Id_Langue` int(11) NOT NULL,
  `id_Video` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `Id_Service` int(11) NOT NULL,
  `libelle_Service` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`Id_Service`, `libelle_Service`) VALUES
(1, 'Directeur'),
(2, 'Responsable communication'),
(3, 'Responsable technique'),
(4, 'Assistante'),
(5, 'Chargés de communication'),
(6, 'Traducteur'),
(7, 'Technicien');

-- --------------------------------------------------------

--
-- Structure de la table `theme_exposition`
--

CREATE TABLE `theme_exposition` (
  `id_Theme` int(11) NOT NULL,
  `libelle_Theme` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `theme_exposition`
--

INSERT INTO `theme_exposition` (`id_Theme`, `libelle_Theme`) VALUES
(1, 'Photographie'),
(2, 'Calligraphie'),
(3, 'Peinture surréalisme'),
(4, 'Sculpture'),
(5, 'Peinture'),
(6, 'Caricature'),
(7, 'Dessin'),
(8, 'Art figuratif'),
(9, 'Sculpture minimaliste'),
(10, 'gravure'),
(11, 'Art contemporain'),
(12, 'Peinture'),
(13, 'Art visuel');

-- --------------------------------------------------------

--
-- Structure de la table `type_oeuvre`
--

CREATE TABLE `type_oeuvre` (
  `Id_Type` int(11) NOT NULL,
  `libelle_Type` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_oeuvre`
--

INSERT INTO `type_oeuvre` (`Id_Type`, `libelle_Type`) VALUES
(1, 'Photographie'),
(2, 'Peinture'),
(3, 'Sculpture'),
(6, 'essai2'),
(7, 'essai2'),
(8, 'essai2up'),
(9, 'essai2up'),
(10, 'essai2up'),
(11, 'essai'),
(12, 'essai');

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE `video` (
  `id_Video` int(11) NOT NULL,
  `libelle_Video` varchar(50) DEFAULT NULL,
  `chemin_Video` varchar(255) DEFAULT NULL,
  `libelle_Langue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD PRIMARY KEY (`Id_Artiste`),
  ADD KEY `id_DirArt` (`id_DirArt`);

--
-- Index pour la table `audio`
--
ALTER TABLE `audio`
  ADD PRIMARY KEY (`id_Audio`),
  ADD KEY `libelle_Langue` (`libelle_Langue`);

--
-- Index pour la table `bio_artist`
--
ALTER TABLE `bio_artist`
  ADD PRIMARY KEY (`Id_bio`),
  ADD KEY `Id_Langue` (`Id_Langue`),
  ADD KEY `Id_Artiste` (`Id_Artiste`);

--
-- Index pour la table `collaborateur`
--
ALTER TABLE `collaborateur`
  ADD PRIMARY KEY (`id_Collaborateur`),
  ADD UNIQUE KEY `Email_Collaborateur` (`Email_Collaborateur`),
  ADD KEY `Id_Service` (`Id_Service`);

--
-- Index pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD PRIMARY KEY (`Id_Exposition`,`Id_Espace`),
  ADD KEY `Id_Espace` (`Id_Espace`);

--
-- Index pour la table `contenu`
--
ALTER TABLE `contenu`
  ADD PRIMARY KEY (`id_Contenu`),
  ADD KEY `libelle_Langue` (`Id_oeuvre`),
  ADD KEY `Id_Langue` (`Id_Langue`);

--
-- Index pour la table `dirart`
--
ALTER TABLE `dirart`
  ADD PRIMARY KEY (`id_DirArt`);

--
-- Index pour la table `espace`
--
ALTER TABLE `espace`
  ADD PRIMARY KEY (`Id_Espace`);

--
-- Index pour la table `exposition`
--
ALTER TABLE `exposition`
  ADD PRIMARY KEY (`Id_Exposition`),
  ADD KEY `Id_Artiste` (`Id_Artiste`),
  ADD KEY `id_Theme` (`id_Theme`);

--
-- Index pour la table `gérer`
--
ALTER TABLE `gérer`
  ADD PRIMARY KEY (`id_Collaborateur`,`Id_Exposition`),
  ADD KEY `Id_Exposition` (`Id_Exposition`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id_Image`),
  ADD KEY `libelle_Langue` (`Id_oeuvre`);

--
-- Index pour la table `langue`
--
ALTER TABLE `langue`
  ADD PRIMARY KEY (`Id_Langue`);

--
-- Index pour la table `oeuvres`
--
ALTER TABLE `oeuvres`
  ADD PRIMARY KEY (`Id_oeuvre`),
  ADD KEY `Id_Exposition` (`Id_Exposition`),
  ADD KEY `Id_Position` (`Id_Position`),
  ADD KEY `Id_Type` (`Id_Type`),
  ADD KEY `Id_Artiste` (`Id_Artiste`);

--
-- Index pour la table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`Id_Position`),
  ADD KEY `Id_Espace` (`Id_Espace`);

--
-- Index pour la table `préparer`
--
ALTER TABLE `préparer`
  ADD PRIMARY KEY (`id_Collaborateur`,`id_Contenu`),
  ADD KEY `id_Contenu` (`id_Contenu`);

--
-- Index pour la table `présenter_3`
--
ALTER TABLE `présenter_3`
  ADD PRIMARY KEY (`Id_Langue`,`id_Audio`),
  ADD KEY `id_Audio` (`id_Audio`);

--
-- Index pour la table `présenter_4`
--
ALTER TABLE `présenter_4`
  ADD PRIMARY KEY (`Id_Langue`,`id_Video`),
  ADD KEY `id_Video` (`id_Video`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`Id_Service`);

--
-- Index pour la table `theme_exposition`
--
ALTER TABLE `theme_exposition`
  ADD PRIMARY KEY (`id_Theme`);

--
-- Index pour la table `type_oeuvre`
--
ALTER TABLE `type_oeuvre`
  ADD PRIMARY KEY (`Id_Type`);

--
-- Index pour la table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_Video`),
  ADD KEY `libelle_Langue` (`libelle_Langue`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `artiste`
--
ALTER TABLE `artiste`
  MODIFY `Id_Artiste` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `audio`
--
ALTER TABLE `audio`
  MODIFY `id_Audio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bio_artist`
--
ALTER TABLE `bio_artist`
  MODIFY `Id_bio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT pour la table `collaborateur`
--
ALTER TABLE `collaborateur`
  MODIFY `id_Collaborateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `contenu`
--
ALTER TABLE `contenu`
  MODIFY `id_Contenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT pour la table `dirart`
--
ALTER TABLE `dirart`
  MODIFY `id_DirArt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `espace`
--
ALTER TABLE `espace`
  MODIFY `Id_Espace` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `exposition`
--
ALTER TABLE `exposition`
  MODIFY `Id_Exposition` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id_Image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `langue`
--
ALTER TABLE `langue`
  MODIFY `Id_Langue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `oeuvres`
--
ALTER TABLE `oeuvres`
  MODIFY `Id_oeuvre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `position`
--
ALTER TABLE `position`
  MODIFY `Id_Position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `Id_Service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `type_oeuvre`
--
ALTER TABLE `type_oeuvre`
  MODIFY `Id_Type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `video`
--
ALTER TABLE `video`
  MODIFY `id_Video` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD CONSTRAINT `artiste_ibfk_1` FOREIGN KEY (`id_DirArt`) REFERENCES `dirart` (`id_DirArt`);

--
-- Contraintes pour la table `audio`
--
ALTER TABLE `audio`
  ADD CONSTRAINT `audio_ibfk_1` FOREIGN KEY (`libelle_Langue`) REFERENCES `oeuvres` (`Id_oeuvre`);

--
-- Contraintes pour la table `bio_artist`
--
ALTER TABLE `bio_artist`
  ADD CONSTRAINT `bio_artist_ibfk_1` FOREIGN KEY (`Id_Langue`) REFERENCES `langue` (`Id_Langue`),
  ADD CONSTRAINT `bio_artist_ibfk_2` FOREIGN KEY (`Id_Artiste`) REFERENCES `artiste` (`Id_Artiste`);

--
-- Contraintes pour la table `collaborateur`
--
ALTER TABLE `collaborateur`
  ADD CONSTRAINT `collaborateur_ibfk_1` FOREIGN KEY (`Id_Service`) REFERENCES `service` (`Id_Service`);

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`Id_Exposition`) REFERENCES `exposition` (`Id_Exposition`),
  ADD CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`Id_Espace`) REFERENCES `espace` (`Id_Espace`);

--
-- Contraintes pour la table `contenu`
--
ALTER TABLE `contenu`
  ADD CONSTRAINT `contenu_ibfk_1` FOREIGN KEY (`Id_oeuvre`) REFERENCES `oeuvres` (`Id_oeuvre`),
  ADD CONSTRAINT `contenu_ibfk_2` FOREIGN KEY (`Id_Langue`) REFERENCES `langue` (`Id_Langue`);

--
-- Contraintes pour la table `exposition`
--
ALTER TABLE `exposition`
  ADD CONSTRAINT `exposition_ibfk_1` FOREIGN KEY (`Id_Artiste`) REFERENCES `artiste` (`Id_Artiste`),
  ADD CONSTRAINT `exposition_ibfk_2` FOREIGN KEY (`id_Theme`) REFERENCES `theme_exposition` (`id_Theme`);

--
-- Contraintes pour la table `gérer`
--
ALTER TABLE `gérer`
  ADD CONSTRAINT `gérer_ibfk_1` FOREIGN KEY (`id_Collaborateur`) REFERENCES `collaborateur` (`id_Collaborateur`),
  ADD CONSTRAINT `gérer_ibfk_2` FOREIGN KEY (`Id_Exposition`) REFERENCES `exposition` (`Id_Exposition`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`Id_oeuvre`) REFERENCES `oeuvres` (`Id_oeuvre`);

--
-- Contraintes pour la table `oeuvres`
--
ALTER TABLE `oeuvres`
  ADD CONSTRAINT `oeuvres_ibfk_1` FOREIGN KEY (`Id_Exposition`) REFERENCES `exposition` (`Id_Exposition`),
  ADD CONSTRAINT `oeuvres_ibfk_2` FOREIGN KEY (`Id_Position`) REFERENCES `position` (`Id_Position`),
  ADD CONSTRAINT `oeuvres_ibfk_3` FOREIGN KEY (`Id_Type`) REFERENCES `type_oeuvre` (`Id_Type`),
  ADD CONSTRAINT `oeuvres_ibfk_4` FOREIGN KEY (`Id_Artiste`) REFERENCES `artiste` (`Id_Artiste`);

--
-- Contraintes pour la table `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `position_ibfk_1` FOREIGN KEY (`Id_Espace`) REFERENCES `espace` (`Id_Espace`);

--
-- Contraintes pour la table `préparer`
--
ALTER TABLE `préparer`
  ADD CONSTRAINT `préparer_ibfk_1` FOREIGN KEY (`id_Collaborateur`) REFERENCES `collaborateur` (`id_Collaborateur`),
  ADD CONSTRAINT `préparer_ibfk_2` FOREIGN KEY (`id_Contenu`) REFERENCES `contenu` (`id_Contenu`);

--
-- Contraintes pour la table `présenter_3`
--
ALTER TABLE `présenter_3`
  ADD CONSTRAINT `présenter_3_ibfk_1` FOREIGN KEY (`Id_Langue`) REFERENCES `langue` (`Id_Langue`),
  ADD CONSTRAINT `présenter_3_ibfk_2` FOREIGN KEY (`id_Audio`) REFERENCES `audio` (`id_Audio`);

--
-- Contraintes pour la table `présenter_4`
--
ALTER TABLE `présenter_4`
  ADD CONSTRAINT `présenter_4_ibfk_1` FOREIGN KEY (`Id_Langue`) REFERENCES `langue` (`Id_Langue`),
  ADD CONSTRAINT `présenter_4_ibfk_2` FOREIGN KEY (`id_Video`) REFERENCES `video` (`id_Video`);

--
-- Contraintes pour la table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`libelle_Langue`) REFERENCES `oeuvres` (`Id_oeuvre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
