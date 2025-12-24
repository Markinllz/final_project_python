--
-- PostgreSQL database dump
--

\restrict 7isiWuWFybOSOXRD17lImoaXGQ4aASX0IqWh7XICo93pO2RMXMljBtHUX36M2hj

-- Dumped from database version 16.11 (Homebrew)
-- Dumped by pg_dump version 16.11 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: decks; Type: TABLE; Schema: public; Owner: daniilgrecin
--

CREATE TABLE public.decks (
    id bigint NOT NULL,
    name text NOT NULL,
    owner_id bigint,
    type text DEFAULT 'default'::text NOT NULL
);


ALTER TABLE public.decks OWNER TO daniilgrecin;

--
-- Name: decks_id_seq; Type: SEQUENCE; Schema: public; Owner: daniilgrecin
--

CREATE SEQUENCE public.decks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.decks_id_seq OWNER TO daniilgrecin;

--
-- Name: decks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daniilgrecin
--

ALTER SEQUENCE public.decks_id_seq OWNED BY public.decks.id;


--
-- Name: levels; Type: TABLE; Schema: public; Owner: daniilgrecin
--

CREATE TABLE public.levels (
    id bigint NOT NULL,
    level_name text NOT NULL
);


ALTER TABLE public.levels OWNER TO daniilgrecin;

--
-- Name: levels_id_seq; Type: SEQUENCE; Schema: public; Owner: daniilgrecin
--

CREATE SEQUENCE public.levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.levels_id_seq OWNER TO daniilgrecin;

--
-- Name: levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daniilgrecin
--

ALTER SEQUENCE public.levels_id_seq OWNED BY public.levels.id;


--
-- Name: user_word_stats; Type: TABLE; Schema: public; Owner: daniilgrecin
--

CREATE TABLE public.user_word_stats (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    word_id bigint NOT NULL,
    success_count integer DEFAULT 0 NOT NULL,
    attempt_count integer DEFAULT 0 NOT NULL,
    last_shown_at timestamp with time zone
);


ALTER TABLE public.user_word_stats OWNER TO daniilgrecin;

--
-- Name: user_word_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: daniilgrecin
--

CREATE SEQUENCE public.user_word_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_word_stats_id_seq OWNER TO daniilgrecin;

--
-- Name: user_word_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daniilgrecin
--

ALTER SEQUENCE public.user_word_stats_id_seq OWNED BY public.user_word_stats.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: daniilgrecin
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    telegram_id bigint,
    username text,
    streak integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO daniilgrecin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: daniilgrecin
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO daniilgrecin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daniilgrecin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: words; Type: TABLE; Schema: public; Owner: daniilgrecin
--

CREATE TABLE public.words (
    id bigint NOT NULL,
    deck_id bigint NOT NULL,
    front text NOT NULL,
    back text NOT NULL
);


ALTER TABLE public.words OWNER TO daniilgrecin;

--
-- Name: words_id_seq; Type: SEQUENCE; Schema: public; Owner: daniilgrecin
--

CREATE SEQUENCE public.words_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.words_id_seq OWNER TO daniilgrecin;

--
-- Name: words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daniilgrecin
--

ALTER SEQUENCE public.words_id_seq OWNED BY public.words.id;


--
-- Name: decks id; Type: DEFAULT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.decks ALTER COLUMN id SET DEFAULT nextval('public.decks_id_seq'::regclass);


--
-- Name: levels id; Type: DEFAULT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.levels ALTER COLUMN id SET DEFAULT nextval('public.levels_id_seq'::regclass);


--
-- Name: user_word_stats id; Type: DEFAULT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.user_word_stats ALTER COLUMN id SET DEFAULT nextval('public.user_word_stats_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: words id; Type: DEFAULT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.words ALTER COLUMN id SET DEFAULT nextval('public.words_id_seq'::regclass);


--
-- Data for Name: decks; Type: TABLE DATA; Schema: public; Owner: daniilgrecin
--

COPY public.decks (id, name, owner_id, type) FROM stdin;
2	Бытовой Английский Light	1	default
3	Бытовой Английский Hard	1	default
1	Бизнес Английский Light	1	default
5	Бизнес английский Hard	1	default
4	Путешествия Light	1	default
6	Путешествия Hard	1	default
7	Спорт Light	1	default
8	Спорт Hard	1	default
9	Политика Light	1	default
10	Политика Hard	1	default
11	Кулинария Light	1	default
12	Кулинария Hard	1	default
13	Фильмы Light	1	default
14	Фильмы Hard	1	default
15	Книги Light	1	default
16	Книги Hard	1	default
17	Технологии Light	1	default
18	Технологии Hard	1	default
19	General English A1	1	default
22	General English A2	1	default
23	General English B1	1	default
24	General English B2	1	default
25	General English C1	1	default
26	General English C2	1	default
\.


--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: daniilgrecin
--

COPY public.levels (id, level_name) FROM stdin;
\.


--
-- Data for Name: user_word_stats; Type: TABLE DATA; Schema: public; Owner: daniilgrecin
--

COPY public.user_word_stats (id, user_id, word_id, success_count, attempt_count, last_shown_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: daniilgrecin
--

COPY public.users (id, telegram_id, username, streak) FROM stdin;
1	1234555	admin	0
2	1427673958	dsg_krakatand	0
\.


--
-- Data for Name: words; Type: TABLE DATA; Schema: public; Owner: daniilgrecin
--

COPY public.words (id, deck_id, front, back) FROM stdin;
1416	5	acquisition	поглощение, приобретение компании
1417	5	merger	слияние компаний
1418	5	divestment	избавление от активов, продажа части бизнеса
1419	5	affiliate	дочерняя/аффилированная компания
1420	5	subsidiary	дочерняя компания
1421	5	parent company	материнская компания
1422	5	conglomerate	конгломерат
3054	15	book	книга
11	1	business	бизнес
12	1	company	компания
13	1	client	клиент
14	1	customer	покупатель, клиент
15	1	consumer	потребитель
16	1	manager	менеджер, руководитель
17	1	employee	сотрудник, работник
18	1	employer	работодатель
19	1	colleague	коллега
20	1	team	команда
21	1	boss	начальник, босс
22	1	partner	партнёр
23	1	stakeholder	заинтересованная сторона
24	1	shareholder	акционер
25	1	department	отдел
26	1	division	подразделение
27	1	unit	подразделение, единица
28	1	branch	филиал
29	1	headquarters	штаб‑квартира
30	1	subsidiary	дочерняя компания
31	1	corporation	корпорация
32	1	enterprise	предприятие
33	1	startup	стартап
34	1	small business	малый бизнес
35	1	entrepreneur	предприниматель
36	1	self-employed	самозанятый
37	1	freelancer	фрилансер
38	1	vendor	продавец, поставщик
39	1	supplier	поставщик
40	1	distributor	дистрибьютор
41	1	wholesaler	оптовый продавец
42	1	retailer	розничный продавец
43	1	market	рынок
44	1	market share	доля рынка
45	1	competition	конкуренция
46	1	competitor	конкурент
47	1	niche	ниша
48	1	industry	отрасль, индустрия
49	1	sector	сектор
50	1	trend	тенденция
51	1	demand	спрос
52	1	supply	предложение
53	1	offer	предложение (коммерческое)
54	1	proposal	предложение (деловое)
55	1	quote	коммерческое предложение, смета
56	1	tender	тендер
57	1	bid	заявка, предложение цены
58	1	deal	сделка
59	1	transaction	транзакция, сделка
60	1	merger	слияние компаний
61	1	acquisition	поглощение компании
62	1	joint venture	совместное предприятие
63	1	partnership	партнёрство
64	1	negotiation	переговоры
65	1	bargain	выгодная сделка, торговаться
66	1	agreement	соглашение
67	1	contract	контракт, договор
68	1	clause	пункт договора
69	1	terms and conditions	условия и положения
70	1	obligation	обязательство
71	1	liability	ответственность, обязательство
72	1	penalty	штраф, санкция
73	1	breach of contract	нарушение договора
74	1	confidentiality	конфиденциальность
75	1	non-disclosure agreement	соглашение о неразглашении
76	1	intellectual property	интеллектуальная собственность
77	1	patent	патент
78	1	trademark	товарный знак
79	1	copyright	авторское право
80	1	brand	бренд
81	1	logo	логотип
82	1	reputation	репутация
83	1	image	имидж
84	1	strategy	стратегия
85	1	tactic	тактика
86	1	business plan	бизнес‑план
87	1	roadmap	дорожная карта
88	1	vision	видение
89	1	mission	миссия
90	1	mission statement	формулировка миссии
91	1	goal	цель
92	1	objective	цель, задача
93	1	target	плановый показатель, цель
94	1	milestone	важный этап
95	1	priority	приоритет
96	1	policy	политика компании
97	1	procedure	процедура
98	1	rule	правило
99	1	regulation	норма, регламент
100	1	compliance	соблюдение норм, комплаенс
101	1	audit	аудит
102	1	risk	риск
103	1	opportunity	возможность
104	1	strength	сильная сторона
105	1	weakness	слабая сторона
106	1	threat	угроза
107	1	SWOT analysis	SWOT‑анализ
108	1	budget	бюджет
109	1	forecast	прогноз
110	1	projection	прогноз (цифровой)
111	1	revenue	выручка
112	1	income	доход
113	1	profit	прибыль
114	1	gross profit	валовая прибыль
115	1	net profit	чистая прибыль
116	1	loss	убыток
117	1	turnover	товарооборот
118	1	expense	расход
119	1	cost	стоимость, издержки
120	1	fixed costs	постоянные издержки
121	1	variable costs	переменные издержки
122	1	price	цена
123	1	pricing	ценообразование
124	1	margin	маржа
125	1	cash	наличные
126	1	cash flow	денежный поток
127	1	capital	капитал
128	1	working capital	оборотный капитал
129	1	investment	инвестиция
130	1	investor	инвестор
131	1	portfolio	портфель (инвестиций)
132	1	loan	заём, кредит
133	1	credit	кредит
134	1	debt	долг
135	1	interest	процент
136	1	interest rate	процентная ставка
137	1	installment	платёж по частям
138	1	mortgage	ипотека
139	1	tax	налог
140	1	VAT	НДС
141	1	tax return	налоговая декларация
142	1	tax rate	налоговая ставка
143	1	accounting	бухгалтерский учёт
144	1	accountant	бухгалтер
145	1	balance sheet	бухгалтерский баланс
146	1	income statement	отчёт о прибылях и убытках
147	1	P&L	отчёт о прибылях и убытках
148	1	statement of cash flows	отчёт о движении денежных средств
149	1	invoice	счёт‑фактура
150	1	bill	счёт
151	1	receipt	квитанция, чек
152	1	payment	платёж
153	1	advance payment	предоплата
154	1	deposit	депозит, залог
155	1	refund	возврат денег
156	1	budget cut	сокращение бюджета
157	1	cost reduction	сокращение затрат
158	1	savings	сэкономленные средства
159	1	efficiency	эффективность
160	1	productivity	продуктивность
161	1	performance	результативность
162	1	KPI	ключевой показатель эффективности
163	1	target audience	целевая аудитория
164	1	campaign	кампания
165	1	advertising	реклама
166	1	marketing	маркетинг
167	1	promotion	продвижение
168	1	brand awareness	узнаваемость бренда
169	1	customer loyalty	лояльность клиентов
170	1	customer retention	удержание клиентов
171	1	customer satisfaction	удовлетворённость клиентов
172	1	market research	маркетинговое исследование
173	1	survey	опрос
174	1	questionnaire	анкета
175	1	focus group	фокус‑группа
176	1	feedback	обратная связь
177	1	review	отзыв, обзор
178	1	rating	рейтинг, оценка
179	1	data	данные
180	1	database	база данных
181	1	analysis	анализ
182	1	analytics	аналитика
183	1	insight	вывод, инсайт
184	1	report	отчёт
185	1	summary	краткое резюме, сводка
186	1	presentation	презентация
187	1	slide	слайд
188	1	deck	презентация (разг.)
189	1	meeting	встреча, совещание
190	1	appointment	деловая встреча
191	1	conference	конференция
192	1	workshop	мастер‑класс, практикум
193	1	seminar	семинар
194	1	webinar	вебинар
394	2	taxi	такси
195	1	conference call	совещание по телефону
196	1	video call	видеозвонок
197	1	agenda	повестка дня
198	1	minutes	протокол собрания
199	1	chairperson	председатель собрания
200	1	participant	участник
201	1	host	ведущий, организатор
202	1	deadline	крайний срок
203	1	extension	продление
204	1	schedule	график, расписание
205	1	timeline	сроки, временная шкала
206	1	time management	управление временем
207	1	workload	нагрузка
208	1	shift	смена
209	1	overtime	сверхурочная работа
210	1	remote work	удалённая работа
211	1	hybrid work	гибридный формат работы
212	1	on-site	на месте, в офисе
213	1	office hours	рабочие часы
214	1	break	перерыв
215	1	lunch break	обеденный перерыв
216	1	coffee break	кофе‑брейк
217	1	business trip	командировка
218	1	travel expenses	командировочные расходы
219	1	per diem	суточные
220	1	allowance	надбавка, пособие
221	1	salary	зарплата (фиксированная)
222	1	wage	почасовая/сдельная оплата
223	1	bonus	премия
224	1	commission	комиссионные
225	1	benefits	соцпакет, льготы
226	1	pension	пенсия
227	1	insurance	страховка
228	1	health insurance	медицинская страховка
229	1	sick leave	больничный
230	1	paid leave	оплачиваемый отпуск
231	1	vacation	отпуск
232	1	public holiday	государственный праздник
233	1	unpaid leave	неоплачиваемый отпуск
234	1	HR	отдел кадров, HR
235	1	human resources	человеческие ресурсы
236	1	recruitment	набор персонала
237	1	job posting	объявление о вакансии
238	1	vacancy	вакансия
239	1	candidate	кандидат
240	1	CV	резюме
241	1	cover letter	сопроводительное письмо
242	1	job interview	собеседование
243	1	offer letter	письмо‑предложение о работе
244	1	onboarding	ввод в должность, онбординг
245	1	offboarding	выход из компании
246	1	probation period	испытательный срок
247	1	promotion	повышение
248	1	demotion	понижение
249	1	transfer	перевод (в другой отдел)
250	1	layoff	сокращение штата
251	1	dismissal	увольнение
252	1	resignation	увольнение по собственному желанию
253	1	notice period	срок уведомления
254	1	turnover rate	текучесть кадров
255	1	training	обучение
256	1	internship	стажировка
257	1	mentor	наставник
258	1	mentee	подопечный
259	1	coaching	коучинг
260	1	career path	карьерный путь
261	1	skill	навык
262	1	soft skills	гибкие навыки
263	1	hard skills	технические навыки
264	1	leadership	лидерство
265	1	management	управление
266	1	supervisor	руководитель
267	1	executive	топ‑менеджер
268	1	CEO	генеральный директор
269	1	CFO	финансовый директор
270	1	COO	операционный директор
271	1	CTO	технический директор
272	1	board of directors	совет директоров
273	1	chairman	председатель совета
274	1	decision-maker	лицо, принимающее решения
275	1	authority	полномочия
276	1	responsibility	ответственность, обязанность
277	1	accountability	подотчётность
278	1	delegation	делегирование
279	1	conflict	конфликт
280	1	mediation	медиация
281	1	agreement	соглашение, договорённость
282	1	compromise	компромисс
283	1	solution	решение проблемы
284	1	issue	проблема, вопрос
285	1	challenge	сложность, вызов
286	1	improvement	улучшение
287	1	innovation	инновация
288	1	initiative	инициатива
289	1	proposal	предложение
290	1	approval	одобрение
291	1	rejection	отклонение
292	1	follow-up	дальнейшее действие, фоллоу‑ап
293	1	update	обновление, свежая информация
294	1	reminder	напоминание
295	1	attachment	вложение (в письме)
296	1	draft	черновик
297	1	final version	финальная версия
298	1	deadline-driven	ориентированный на дедлайны
299	1	time-sensitive	чувствительный к срокам
300	1	priority task	задача в приоритете
301	1	backlog	накопившиеся задачи
302	1	to schedule a meeting	назначить встречу
303	1	to cancel a meeting	отменить встречу
304	1	to reschedule	перенести по времени
305	1	to negotiate	вести переговоры
306	1	to sign a contract	подписать контракт
307	1	to close a deal	закрыть сделку
308	1	to launch a product	запустить продукт
309	1	to meet a deadline	уложиться в срок
310	1	to miss a deadline	пропустить срок
311	1	to follow the policy	следовать политике
312	1	to break the rules	нарушать правила
313	1	office	офис
314	1	open space	открытый офис
315	1	cubicle	офисная кабинка
316	1	conference room	переговорная
317	1	meeting room	комната для совещаний
318	1	reception	ресепшен
319	1	receptionist	администратор, секретарь
320	1	workplace	рабочее место
321	1	desk	рабочий стол
322	1	chair	стул, кресло
323	1	equipment	оборудование
324	1	printer	принтер
325	1	scanner	сканер
326	1	photocopier	ксерокс
327	1	stationery	канцелярия
328	1	notebook	блокнот
329	1	folder	папка
330	1	file	файл
331	1	email	электронная почта
332	1	inbox	входящие
333	1	attachment	вложение
334	1	reply	ответить
335	1	forward	переслать
336	1	CC	копия (в письме)
337	1	BCC	скрытая копия
338	1	signature	подпись в письме
339	2	house	дом
340	2	flat	квартира
341	2	room	комната
342	2	kitchen	кухня
343	2	bathroom	ванная
344	2	toilet	туалет
345	2	bedroom	спальня
346	2	living room	гостиная
347	2	hall	прихожая, холл
348	2	balcony	балкон
349	2	floor	этаж, пол
350	2	ceiling	потолок
351	2	wall	стена
352	2	door	дверь
353	2	window	окно
354	2	key	ключ
355	2	lock	замок
356	2	stairs	лестница
357	2	lift	лифт
358	2	garden	сад
359	2	yard	двор
360	2	garage	гараж
361	2	roof	крыша
362	2	address	адрес
363	2	neighbour	сосед
364	2	city	город
365	2	town	городок
366	2	village	деревня
367	2	street	улица
368	2	road	дорога
369	2	square	площадь
370	2	shop	магазин
371	2	supermarket	супермаркет
372	2	mall	торговый центр
373	2	market	рынок
374	2	pharmacy	аптека
375	2	bank	банк
376	2	post office	почта
377	2	hospital	больница
378	2	clinic	поликлиника
379	2	school	школа
380	2	university	университет
381	2	park	парк
382	2	restaurant	ресторан
383	2	cafe	кафе
384	2	bar	бар
385	2	cinema	кинотеатр
386	2	theatre	театр
387	2	museum	музей
388	2	library	библиотека
389	2	gym	спортзал
390	2	pool	бассейн
391	2	bus stop	автобусная остановка
392	2	station	станция, вокзал
393	2	airport	аэропорт
395	2	car	машина
396	2	bike	велосипед
397	2	train	поезд
398	2	plane	самолёт
399	2	ticket	билет
400	2	travel	путешествовать
401	2	trip	поездка
402	2	journey	путешествие
403	2	luggage	багаж
404	2	bag	сумка
405	2	backpack	рюкзак
406	2	wallet	кошелёк
407	2	purse	женский кошелёк
408	2	money	деньги
409	2	cash	наличные
410	2	card	карта
411	2	price	цена
412	2	cheap	дешёвый
413	2	expensive	дорогой
414	2	bill	счёт
415	2	change	сдача
416	2	queue	очередь
417	2	sale	распродажа
418	2	discount	скидка
419	2	size	размер
420	2	receipt	чек
421	2	open	открытый
422	2	closed	закрытый
423	2	buy	покупать
424	2	sell	продавать
425	2	order	заказывать
426	2	book	бронировать
427	2	pay	платить
428	2	eat	есть
429	2	drink	пить
430	2	breakfast	завтрак
431	2	lunch	обед
432	2	dinner	ужин
433	2	meal	приём пищи
434	2	food	еда
435	2	water	вода
436	2	tea	чай
437	2	coffee	кофе
438	2	milk	молоко
439	2	juice	сок
440	2	bread	хлеб
441	2	butter	масло
442	2	cheese	сыр
443	2	egg	яйцо
444	2	meat	мясо
445	2	chicken	курица
446	2	fish	рыба
447	2	rice	рис
448	2	pasta	макароны
449	2	soup	суп
450	2	salad	салат
451	2	fruit	фрукты
452	2	vegetable	овощ
453	2	apple	яблоко
454	2	banana	банан
455	2	orange	апельсин
456	2	tomato	помидор
457	2	potato	картофель
458	2	onion	лук
459	2	salt	соль
460	2	sugar	сахар
461	2	pepper	перец
462	2	sweet	сладкий
463	2	sour	кислый
464	2	hot	горячий, острый
465	2	cold	холодный
466	2	hungry	голодный
467	2	thirsty	хочет пить
468	2	full	сытый
469	2	cook	готовить
470	2	kitchen	кухня
471	2	fridge	холодильник
472	2	freezer	морозильник
473	2	oven	духовка
474	2	stove	плита
475	2	microwave	микроволновка
476	2	cup	чашка
477	2	glass	стакан
478	2	plate	тарелка
479	2	bowl	миска
480	2	fork	вилка
481	2	knife	нож
482	2	spoon	ложка
483	2	napkin	салфетка
484	2	table	стол
485	2	chair	стул
486	2	sofa	диван
487	2	armchair	кресло
488	2	bed	кровать
489	2	pillow	подушка
490	2	blanket	одеяло
491	2	sheet	простыня
492	2	wardrobe	шкаф
493	2	shelf	полка
494	2	carpet	ковёр
495	2	curtain	штора
496	2	lamp	лампа
497	2	light	свет
498	2	switch	выключатель
499	2	socket	розетка
500	2	TV	телевизор
501	2	remote control	пульт
502	2	computer	компьютер
503	2	laptop	ноутбук
504	2	phone	телефон
505	2	charger	зарядка
506	2	internet	интернет
507	2	screen	экран
508	2	password	пароль
509	2	message	сообщение
510	2	call	звонить
511	2	answer	отвечать
512	2	text	писать сообщение
513	2	send	отправлять
514	2	receive	получать
515	2	friend	друг
516	2	family	семья
517	2	mother	мама
518	2	father	папа
519	2	parent	родитель
520	2	son	сын
521	2	daughter	дочь
522	2	brother	брат
523	2	sister	сестра
524	2	child	ребёнок
525	2	baby	младенец
526	2	husband	муж
527	2	wife	жена
528	2	relative	родственник
529	2	neighbor	сосед
530	2	man	мужчина
531	2	woman	женщина
532	2	people	люди
533	2	person	человек
534	2	friendship	дружба
535	2	help	помощь
536	2	birthday	день рождения
537	2	holiday	праздник, отпуск
538	2	party	вечеринка
539	2	gift	подарок
540	2	present	подарок
541	2	music	музыка
542	2	song	песня
543	2	movie	фильм
544	2	game	игра
545	2	sport	спорт
546	2	football	футбол
547	2	basketball	баскетбол
548	2	volleyball	волейбол
549	2	tennis	теннис
550	2	run	бегать
551	2	walk	гулять, ходить
552	2	swim	плавать
553	2	ride	ездить верхом, кататься
554	2	read	читать
555	2	write	писать
556	2	draw	рисовать
557	2	sleep	спать
558	2	rest	отдыхать
559	2	work	работать
560	2	study	учиться
561	2	learn	учить
562	2	teach	преподавать
563	2	job	работа
564	2	school	школа
565	2	homework	домашнее задание
566	2	class	урок, занятие
567	2	lesson	урок
568	2	exam	экзамен
569	2	test	тест
570	2	grade	оценка
571	2	morning	утро
572	2	afternoon	день
573	2	evening	вечер
574	2	night	ночь
575	2	day	день
576	2	week	неделя
577	2	month	месяц
578	2	year	год
579	2	today	сегодня
580	2	yesterday	вчера
581	2	tomorrow	завтра
582	2	always	всегда
583	2	usually	обычно
584	2	often	часто
585	2	sometimes	иногда
586	2	rarely	редко
587	2	never	никогда
588	2	now	сейчас
589	2	early	рано
590	2	late	поздно
591	2	soon	скоро
592	2	before	до
593	2	after	после
594	2	first	первый
595	2	last	последний
596	2	morning routine	утренние дела
597	2	go to bed	ложиться спать
598	2	wake up	просыпаться
599	2	get up	вставать
600	2	wash	мыться
601	2	shower	душ
602	2	bath	ванна
603	2	brush teeth	чистить зубы
604	2	comb hair	расчёсывать волосы
605	2	get dressed	одеваться
606	2	undress	раздеваться
607	2	clothes	одежда
608	2	shirt	рубашка
609	2	T-shirt	футболка
610	2	jeans	джинсы
611	2	trousers	брюки
612	2	shorts	шорты
613	2	skirt	юбка
614	2	dress	платье
615	2	jacket	куртка, пиджак
616	2	coat	пальто
617	2	shoes	обувь, туфли
618	2	boots	ботинки
619	2	socks	носки
620	2	hat	шапка, шляпа
621	2	gloves	перчатки
622	2	scarf	шарф
623	2	bag	сумка
624	2	weather	погода
625	2	sunny	солнечно
626	2	cloudy	облачно
627	2	rainy	дождливо
628	2	snowy	снежно
629	2	windy	ветрено
630	2	hot	жарко
631	2	warm	тепло
632	2	cool	прохладно
633	2	cold	холодно
634	2	temperature	температура
635	2	season	время года
636	2	spring	весна
637	2	summer	лето
638	2	autumn	осень
639	2	winter	зима
640	2	rain	дождь
641	2	snow	снег
642	2	wind	ветер
643	2	ice	лёд
644	2	soap	мыло
645	2	shampoo	шампунь
646	2	toothpaste	зубная паста
647	2	toothbrush	зубная щётка
648	2	towel	полотенце
649	2	hairdryer	фен
650	2	mirror	зеркало
651	2	comb	расчёска
652	2	razor	бритва
653	2	toilet paper	туалетная бумага
654	2	washing machine	стиральная машина
655	2	dryer	сушильная машина
656	2	vacuum cleaner	пылесос
657	2	broom	метла
658	2	dustpan	совок
659	2	bucket	ведро
660	2	mop	швабра
661	2	trash	мусор
662	2	bin	ведро для мусора
663	2	rubbish	мусор
664	2	clean	чистый
665	2	dirty	грязный
666	2	tidy	аккуратный, опрятный
667	2	messy	грязный, беспорядочный
668	2	to clean	убирать, чистить
669	2	to wash dishes	мыть посуду
670	2	to wash clothes	стирать одежду
671	2	iron	утюг
672	2	to iron	гладить
673	2	homework	домашняя работа (дела по дому)
674	2	holiday home	дача, дом для отдыха
675	2	rent	аренда
676	2	landlord	арендодатель
677	2	tenant	арендатор
678	2	bill for electricity	счёт за электричество
679	2	gas bill	счёт за газ
680	2	heating	отопление
681	2	air conditioner	кондиционер
682	2	fan	вентилятор
683	2	remote	пульт (сокращённо)
684	2	socket adapter	переходник для розетки
685	2	power bank	портативная зарядка
686	2	headphones	наушники
687	2	earphones	вкладыши (наушники)
688	2	speaker	колонка
689	2	charger cable	кабель зарядки
690	2	bedside table	тумбочка
691	2	desk lamp	настольная лампа
692	2	calendar	календарь
693	2	alarm clock	будильник
694	2	notebook	тетрадь, блокнот
695	2	pen	ручка
696	2	pencil	карандаш
697	2	rubber	стирательная резинка
698	2	paper	бумага
699	2	envelope	конверт
700	2	stamp	марка
701	2	package	посылка
702	2	email address	адрес электронной почты
703	2	phone number	номер телефона
704	2	contact	контакт
705	2	appointment	запись, назначенная встреча
706	2	queue number	номер в очереди
707	2	ID card	удостоверение личности
708	2	passport	паспорт
709	2	ticket office	касса
710	2	platform	платформа
711	2	crosswalk	пешеходный переход
712	2	traffic light	светофор
713	2	crossroads	перекрёсток
714	2	corner	угол
715	2	sidewalk	тротуар
716	2	pedestrian	пешеход
717	2	bus driver	водитель автобуса
718	2	seat	сиденье
719	2	window seat	место у окна
720	2	aisle seat	место у прохода
721	2	map	карта
722	2	direction	направление
723	2	left	лево
724	2	right	право
725	2	straight	прямо
726	2	near	рядом
727	2	far	далеко
728	2	opposite	напротив
729	2	behind	позади
730	2	in front of	перед
731	2	next to	рядом с
732	2	between	между
733	2	corner shop	магазин у дома
734	2	butcher	мясная лавка
735	2	bakery	пекарня
736	2	greengrocer	овощной магазин
737	2	pet shop	зоомагазин
6774	25	labour	труд
738	2	toy shop	магазин игрушек
739	2	clothes shop	магазин одежды
740	2	shoe shop	обувной магазин
741	2	bookshop	книжный магазин
742	2	newsstand	киоск с газетами
743	2	hairdresser	парикмахер
744	2	barber	барбер, мужской парикмахер
745	2	beauty salon	салон красоты
746	2	appointment book	журнал записей
747	2	queue ticket	талон в очередь
748	2	waiting room	комната ожидания
749	2	reception desk	стойка регистрации
750	2	nurse	медсестра
751	2	doctor	врач
752	2	dentist	стоматолог
753	2	pain	боль
754	2	headache	головная боль
755	2	stomachache	боль в животе
756	2	backache	боль в спине
757	2	cold (illness)	простуда
758	2	flu	грипп
759	2	temperature (fever)	температура (жар)
760	2	medicine	лекарство
761	2	pill	таблетка
762	2	syrup	сироп
763	2	bandage	бинт
764	2	plaster	лейкопластырь
765	2	first aid kit	аптечка
766	2	healthy	здоровый
767	2	ill	больной
768	2	tired	уставший
769	2	relaxed	расслабленный
770	2	bored	скучающий
771	2	worried	взволнованный, обеспокоенный
772	2	angry	злой
773	2	happy	счастливый
774	2	sad	грустный
775	2	excited	взволнованный, радостный
776	2	hungry	голодный
777	2	thirsty	испытывающий жажду
778	2	late for work	опаздывать на работу
779	2	in a hurry	торопиться
780	2	free time	свободное время
781	2	hobby	хобби
782	2	relax	расслабляться
783	2	go shopping	ходить по магазинам
784	2	go for a walk	идти на прогулку
785	2	meet friends	встречаться с друзьями
786	2	have a rest	отдыхать
787	2	stay at home	оставаться дома
788	2	go out	выходить куда‑то
789	2	clean the house	убирать дом
790	2	cook dinner	готовить ужин
791	2	do the dishes	мыть посуду
792	2	do the laundry	стирать бельё
793	2	take out the trash	выносить мусор
794	2	walk the dog	выгуливать собаку
795	2	feed the cat	кормить кота
796	3	household	домашнее хозяйство
797	3	appliance	бытовой прибор
798	3	furniture	мебель
799	3	maintenance	обслуживание, уход
800	3	repair	ремонт
801	3	decoration	украшение, отделка
802	3	renovation	ремонт, обновление
803	3	landlord	арендодатель
804	3	tenant	арендатор
805	3	neighbourhood	окрестности, район
806	3	residential area	жилой район
807	3	downtown	центр города
808	3	suburbs	пригород
809	3	public transport	общественный транспорт
810	3	commute	ездить на работу/учёбу
811	3	rush hour	час пик
812	3	traffic jam	пробка
813	3	pedestrian zone	пешеходная зона
814	3	parking space	парковочное место
815	3	parking fine	штраф за парковку
816	3	household chores	домашние обязанности
817	3	routine	рутина, распорядок
818	3	daily schedule	ежедневное расписание
819	3	grocery shopping	покупка продуктов
820	3	household goods	товары для дома
821	3	second-hand shop	секонд‑хенд
822	3	receipt refund	возврат по чеку
823	3	loyalty card	карта лояльности
824	3	delivery service	служба доставки
825	3	takeaway	еда навынос
826	3	leftovers	остатки еды
827	3	homemade	домашнего приготовления
828	3	frozen food	замороженная еда
829	3	ingredients	ингредиенты
830	3	recipe	рецепт
831	3	to peel	чистить (овощи, фрукты)
832	3	to boil	варить, кипятить
833	3	to fry	жарить
834	3	to bake	запекать, печь
835	3	to grill	готовить на гриле
836	3	to season	приправлять
837	3	left-handed	левша
838	3	right-handed	правша
839	3	household budget	семейный бюджет
840	3	expenses	расходы
841	3	savings	сбережения
842	3	pocket money	карманные деньги
843	3	salary payment	выплата зарплаты
844	3	rent contract	договор аренды
845	3	utility bills	коммунальные счета
846	3	electricity bill	счёт за электричество
847	3	gas meter	газовый счётчик
848	3	water meter	счётчик воды
849	3	waste	отходы
850	3	recycling	переработка мусора
851	3	recycling bin	контейнер для переработки
852	3	environmentally friendly	экологичный
853	3	energy-saving	энергосберегающий
854	3	air pollution	загрязнение воздуха
855	3	noise pollution	шумовое загрязнение
856	3	allergy	аллергия
857	3	appointment with a doctor	запись к врачу
858	3	health insurance	медицинская страховка
859	3	pharmacy receipt	аптечный чек
860	3	symptom	симптом
861	3	treatment	лечение
862	3	prescription	рецепт врача
863	3	to recover	выздоравливать
864	3	to rest properly	как следует отдыхать
865	3	fitness routine	фитнес‑режим
866	3	balanced diet	сбалансированное питание
867	3	junk food	вредная еда
868	3	addiction to sugar	зависимость от сахара
869	3	sleep schedule	режим сна
870	3	oversleep	проспать
871	3	alarm goes off	звонит будильник
872	3	snooze button	кнопка повтора будильника
873	3	housewarming party	новоселье
874	3	flatmate	сосед по квартире
875	3	roommate	сосед по комнате
876	3	shared flat	квартира на двоих/троих
877	3	landlord rules	правила хозяина жилья
878	3	noisy neighbours	шумные соседи
879	3	quiet hours	тихий час, время тишины
880	3	pet-friendly	можно с животными
881	3	no pets allowed	с животными нельзя
882	3	smoke detector	датчик дыма
883	3	fire alarm	пожарная сигнализация
884	3	emergency exit	запасной выход
885	3	first aid course	курс первой помощи
886	3	house key copy	дубликат ключа
887	3	spare key	запасной ключ
888	3	locked out	оказаться снаружи без ключа
889	3	neighbourhood watch	самооборона района, соседский патруль
890	3	security camera	камера наблюдения
891	3	doorbell	дверной звонок
892	3	parcel locker	постамат
893	3	online order tracking	отслеживание заказа онлайн
894	3	subscription	подписка
895	3	streaming service	стриминговый сервис
896	3	screen time	время перед экраном
897	3	battery life	время работы батареи
898	3	data plan	тариф на мобильный интернет
899	3	Wi‑Fi password	пароль от Wi‑Fi
900	3	connection problem	проблема с подключением
901	3	signal strength	уровень сигнала
902	3	offline mode	офлайн‑режим
903	3	to charge a device	заряжать устройство
904	3	to back up data	делать резервную копию
905	3	cloud storage	облачное хранилище
906	3	household routine	домашняя рутина
907	3	time-consuming	отнимающий много времени
908	3	multi-tasking	многозадачность
909	3	priorities	приоритеты
910	3	to postpone chores	откладывать дела по дому
911	3	to catch up on sleep	наверстывать сон
912	3	to run errands	заниматься бытовыми делами вне дома
913	3	detached house	отдельно стоящий дом
914	3	semi-detached house	двухквартирный дом
915	3	terraced house	рядовый дом, таунхаус
916	3	bungalow	одноэтажный дом, бунгало
917	3	studio flat	квартира-студия
918	3	tenant agreement	договор арендатора
919	3	monthly rent	ежемесячная аренда
7515	26	kerb	бордюр
920	3	deposit	залог (при аренде)
921	3	notice period	срок уведомления
922	3	house rules	правила дома
923	3	household appliance	бытовой прибор
924	3	electric kettle	электрический чайник
925	3	coffee maker	кофеварка
926	3	dishwasher	посудомоечная машина
927	3	shelf space	пространство на полках
928	3	storage room	кладовка
929	3	built-in wardrobe	встроенный шкаф
930	3	double bed	двуспальная кровать
931	3	single bed	односпальная кровать
932	3	bunk bed	двухъярусная кровать
933	3	king-size bed	кровать размера «кинг»
934	3	bed linen	постельное бельё
935	3	fitted sheet	простыня на резинке
936	3	duvet	пуховое одеяло
937	3	mattress cover	наматрасник
938	3	blackout curtains	плотные шторы блэкаут
939	3	central heating	центральное отопление
940	3	underfloor heating	тёплый пол
941	3	radiator	радиатор отопления
942	3	thermostat	термостат
943	3	tap	кран (водопроводный)
944	3	leak	протечка
945	3	pipe	труба
946	3	plumber	сантехник
947	3	electrician	электрик
948	3	handyman	мастер на все руки
949	3	caretaker	смотритель, дворник
950	3	doorman	консьерж, швейцар
951	3	security guard	охранник
952	3	entrance code	код от подъезда
953	3	intercom	домофон
954	3	housing office	управляющая компания
955	3	housing problem	проблема с жильём
956	3	rent increase	повышение аренды
957	3	cost of living	стоимость жизни
958	3	household income	доход семьи
959	3	daily expenses	ежедневные расходы
960	3	grocery budget	бюджет на продукты
961	3	financial planning	финансовое планирование
962	3	unexpected bill	неожиданный счёт
963	3	emergency fund	резервный фонд
964	3	online banking	онлайн-банкинг
965	3	bank transfer	банковский перевод
966	3	standing order	автоматический платёж
967	3	direct debit	автосписание средств
968	3	overdraft	овердрафт
969	3	cash machine	банкомат
970	3	contactless payment	бесконтактная оплата
971	3	PIN code	пин-код
972	3	security code	код безопасности
973	3	delivery slot	окно доставки
974	3	delivery fee	стоимость доставки
975	3	home delivery	доставка на дом
976	3	courier	курьер
977	3	tracking number	номер отслеживания
978	3	order confirmation	подтверждение заказа
979	3	out of stock	нет в наличии
980	3	refund policy	политика возврата
981	3	customer support	служба поддержки клиентов
982	3	user review	отзыв пользователя
983	3	rating system	система рейтинга
984	3	household brand	известный бытовой бренд
985	3	laundry basket	корзина для белья
986	3	drying rack	сушилка для белья
987	3	stain remover	пятновыводитель
988	3	fabric softener	кондиционер для белья
989	3	laundry detergent	стиральный порошок
990	3	cleaning product	средство для уборки
991	3	glass cleaner	средство для стёкол
992	3	floor cleaner	средство для пола
993	3	multi-purpose cleaner	универсальное чистящее средство
994	3	disinfectant wipes	дезинфицирующие салфетки
995	3	rubber gloves	резиновые перчатки
996	3	houseplant	комнатное растение
997	3	watering can	лейка
998	3	flower pot	цветочный горшок
999	3	indoor garden	домашний мини-сад
1000	3	reusable bag	многоразовая сумка
1001	3	fabric bag	тканевая сумка
1002	3	plastic-free	без пластика
1003	3	zero waste	ноль отходов
1004	3	minimalism	минимализм
1005	3	declutter	избавляться от лишних вещей
1006	3	storage box	коробка для хранения
1007	3	label	наклейка-ярлык
1008	3	organizer	органайзер
1009	3	desk organizer	органайзер для стола
1010	3	time management app	приложение для планирования времени
1011	3	calendar reminder	напоминание в календаре
1012	3	to-do list	список дел
1013	3	daily habit	ежедневная привычка
1014	3	habit tracker	трекер привычек
1015	3	productive morning	продуктивное утро
1016	3	evening routine	вечерняя рутина
1017	3	meal prep	заготовка еды заранее
1018	3	leftover container	контейнер для остатков
1019	3	microwave-safe	подходящий для микроволновки
1020	3	dish rack	сушилка для посуды
1021	3	tap water	водопроводная вода
1022	3	filtered water	фильтрованная вода
1023	3	water filter	фильтр для воды
1024	3	bottle opener	открывалка
1025	3	corkscrew	штопор
1026	3	cutting board	разделочная доска
1027	3	kitchen scale	кухонные весы
1028	3	measuring cup	мерный стакан
1029	3	measuring spoon	мерная ложка
1030	3	tin opener	ключ для консервов
1031	3	peeler	овощечистка
1032	3	chopping knife	нож для нарезки
1033	3	non-stick pan	сковорода с антипригарным покрытием
1034	3	saucepan	кастрюля
1035	3	frying pan	сковорода
1036	3	baking tray	противень
1037	3	baking paper	пергамент для выпечки
1038	3	cloth	тряпка
1039	3	dishcloth	кухонная тряпка
1040	3	tea towel	кухонное полотенце
1041	3	laundry room	прачечная (комната)
1042	3	shared kitchen	общая кухня
1043	3	shared bathroom	общая ванная
1044	3	noise level	уровень шума
1045	3	flat inspection	проверка квартиры
1046	3	hand over the keys	передать ключи
1047	3	move in	въехать
1048	3	move out	съехать
1049	3	packing boxes	коробки для упаковки
1050	3	moving company	мувинговая компания
1051	3	change of address	смена адреса
1052	3	household routine	повседневная рутина дома
1053	3	weekday	будний день
1054	3	weekend	выходные
1055	3	public holiday	официальный выходной
1056	3	bank holiday	праздничный выходной (брит.)
1057	3	day off	выходной день
1058	3	morning rush	утренняя суета
1059	3	late night	поздняя ночь
1060	3	sleep in	долго спать, валяться
1061	3	take a nap	вздремнуть
1062	3	stay up late	засиживаться допоздна
1063	3	overscheduled	слишком много дел
1064	3	work–life balance	баланс работа–жизнь
1065	3	stressful day	напряжённый день
1066	3	relaxing evening	расслабляющий вечер
1067	3	digital detox	цифровой детокс
1068	3	screen addiction	зависимость от экрана
1069	3	mute notifications	выключить уведомления
1070	3	group chat	групповой чат
1071	3	voice message	голосовое сообщение
1072	3	video call	видеозвонок
1073	3	family chat	семейный чат
1074	3	shared calendar	общий календарь
1075	3	reminder notification	уведомление-напоминание
1076	3	fitness tracker	фитнес-трекер
1077	3	step count	количество шагов
1078	3	sleep tracker	трекер сна
1079	3	sedentary lifestyle	сидячий образ жизни
1080	3	active lifestyle	активный образ жизни
1081	3	healthy habit	здоровая привычка
1082	3	unhealthy habit	вредная привычка
1083	3	snack	перекус
1084	3	midnight snack	ночной перекус
1085	3	homemade snack	домашний перекус
1086	3	take a break	сделать перерыв
1087	3	coffee break	перерыв на кофе
1088	3	lunch break	обеденный перерыв
1089	3	afternoon nap	дневной сон
1090	3	household argument	ссора дома
1091	3	compromise	компромисс
1092	3	shared responsibility	общая ответственность
1093	3	split the bills	делить счета
1094	3	split the chores	делить домашние обязанности
1095	3	family meeting	семейный совет
1096	3	grocery list	список покупок
1097	3	weekly plan	недельный план
1098	3	long-term plan	долгосрочный план
1099	3	unexpected guest	неожиданный гость
1100	3	house guest	гость, живущий у тебя
1101	3	guest room	гостевая комната
1102	3	spare bed	запасная кровать
1103	3	clean up quickly	быстро прибраться
1104	3	tidy up the room	убраться в комнате
1105	3	wipe the table	вытереть стол
1106	3	sweep the floor	подмести пол
1107	3	mop the floor	помыть пол
1108	3	dust the shelves	вытирать пыль с полок
1109	3	change the sheets	сменить постельное бельё
1110	3	do the ironing	гладить вещи
1111	3	deep cleaning	генеральная уборка
1112	3	spring cleaning	весенняя уборка
1113	3	clutter	хлам, беспорядок
1114	3	organised space	организованное пространство
1115	3	crowded room	захламлённая комната
1116	3	cozy atmosphere	уютная атмосфера
1117	3	bright light	яркий свет
1118	3	dim light	тусклый свет
1119	3	natural light	естественный свет
1120	3	air freshener	освежитель воздуха
1121	3	ventilation	вентиляция
1122	3	open the window	открыть окно
1123	3	close the window	закрыть окно
1124	3	lock the door	запереть дверь
1125	3	switch off the lights	выключить свет
1126	3	set an alarm	поставить будильник
1127	3	charge the phone	зарядить телефон
1128	3	check the messages	проверить сообщения
1129	3	scroll social media	листать соцсети
1130	3	lose track of time	потерять счёт времени
1131	3	daily reminder	ежедневное напоминание
1132	3	shopping habit	привычка в покупках
1133	3	impulse purchase	спонтанная покупка
1134	3	shopping list	список покупок
1135	3	budget limit	лимит бюджета
1136	3	monthly subscription	ежемесячная подписка
1137	3	household subscription	семейная подписка
1138	3	cancel a subscription	отменить подписку
1139	3	renew a subscription	продлить подписку
1140	4	travel	путешествовать
1141	4	trip	поездка
1142	4	journey	путешествие (процесс)
1143	4	tour	тур, поездка с экскурсиями
1144	4	holiday	отпуск, каникулы
1145	4	vacation	отпуск
1146	4	business trip	командировка
1147	4	destination	пункт назначения
1148	4	itinerary	маршрут, план поездки
1149	4	route	маршрут
1150	4	sightseeing	осмотр достопримечательностей
1151	4	tourist	турист
1152	4	local	местный житель
1153	4	guide	гид
1154	4	tour guide	экскурсовод
1155	4	travel agency	туристическое агентство
1156	4	booking	бронирование
1157	4	reservation	бронирование, резерв
1158	4	to book a room	забронировать номер
1159	4	to book a flight	забронировать рейс
1160	4	cancel a booking	отменить бронь
1161	4	confirmation	подтверждение
1162	4	confirmation number	номер подтверждения
1163	4	travel insurance	туристическая страховка
1164	4	passport	паспорт
1165	4	visa	виза
1166	4	ID card	удостоверение личности
1167	4	immigration	иммиграционный контроль
1168	4	customs	таможня
1169	4	border control	пограничный контроль
1170	4	luggage	багаж
1171	4	baggage	багаж
1172	4	suitcase	чемодан
1173	4	hand luggage	ручная кладь
1174	4	carry-on bag	ручная кладь
1175	4	backpack	рюкзак
1176	4	check-in desk	стойка регистрации
1177	4	boarding pass	посадочный талон
1178	4	gate	выход на посадку
1179	4	departure	вылет, отправление
1180	4	arrival	прибытие
1181	4	departure board	табло вылета
1182	4	arrival board	табло прилёта
1183	4	security check	досмотр, контроль безопасности
1184	4	metal detector	металлоискатель
1185	4	liquids	жидкости
1186	4	baggage claim	выдача багажа
1187	4	lost and found	бюро находок
1188	4	terminal	терминал
1189	4	runway	взлётно‑посадочная полоса
1190	4	boarding time	время посадки
1191	4	flight	рейс, перелёт
1192	4	flight number	номер рейса
1193	4	direct flight	прямой рейс
1194	4	connecting flight	стыковочный рейс
1195	4	layover	пересадка (короткая остановка)
1196	4	delay	задержка
1197	4	cancelled flight	отменённый рейс
1198	4	on time	по расписанию
1199	4	boarding	посадка на борт
1200	4	take off	взлетать
1201	4	land	приземляться
1202	4	turbulence	турбулентность
1203	4	aisle seat	место у прохода
1204	4	window seat	место у окна
1205	4	economy class	эконом‑класс
1206	4	business class	бизнес‑класс
1207	4	first class	первый класс
1208	4	overhead locker	верхняя багажная полка
1209	4	life vest	спасательный жилет
1210	4	seatbelt	ремень безопасности
1211	4	emergency exit	аварийный выход
1212	4	flight attendant	бортпроводник
1213	4	pilot	пилот
1214	4	crew	экипаж
1215	4	airline	авиалиния
1216	4	airport shuttle	трансфер из аэропорта
1217	4	check-in time	время заезда
1218	4	check-out time	время выезда
1219	4	hotel	отель
1220	4	hostel	хостел
1221	4	motel	мотель
1222	4	guesthouse	гостевой дом
1223	4	reception	ресепшен
1224	4	receptionist	администратор на ресепшене
1225	4	front desk	стойка регистрации
1226	4	lobby	лобби, холл
1227	4	single room	одноместный номер
1228	4	double room	двухместный номер
1229	4	twin room	номер с двумя кроватями
1230	4	suite	люкс
1231	4	room key	ключ от номера
1232	4	key card	карта‑ключ
1233	4	room service	обслуживание в номере
1234	4	wake-up call	звонок‑будильник из отеля
1235	4	late check-out	поздний выезд
1236	4	early check-in	ранний заезд
1237	4	reservation reference	номер брони
1238	4	breakfast included	завтрак включён
1239	4	all inclusive	всё включено
1240	4	half board	полупансион
1241	4	full board	полный пансион
1242	4	amenities	удобства, услуги отеля
1243	4	complimentary	бесплатный (от отеля)
1244	4	no vacancy	нет мест
1245	4	vacancy	есть свободные номера
1246	4	guest	гость
1247	4	host family	принимающая семья
1248	4	shared room	общая комната
1249	4	private room	отдельная комната
1250	4	view	вид из окна
1251	4	city view	вид на город
1252	4	sea view	вид на море
1253	4	mountain view	вид на горы
1254	4	reception hours	часы работы ресепшена
1255	4	hotel review	отзыв об отеле
1256	4	rating	рейтинг
1257	4	host	хозяин жилья (например, в аренде)
1258	4	check-out bill	счёт при выезде
1259	4	city center	центр города
1260	4	old town	старый город
1261	4	tourist attraction	туристическая достопримечательность
1262	4	landmark	знаковое место, достопримечательность
1263	4	monument	памятник
1264	4	castle	замок
1265	4	museum	музей
1266	4	art gallery	художественная галерея
1267	4	cathedral	собор
1268	4	church	церковь
1269	4	temple	храм
1270	4	palace	дворец
1271	4	square	площадь
1272	4	fountain	фонтан
1273	4	bridge	мост
1274	4	harbour	гавань, порт
1275	4	beach	пляж
1276	4	coast	побережье
1277	4	island	остров
1278	4	mountain	гора
1279	4	countryside	сельская местность
1280	4	hiking trail	пешеходная тропа
1281	4	viewpoint	смóтровая площадка
1282	4	guided tour	экскурсия с гидом
1283	4	self-guided tour	самостоятельная экскурсия
1284	4	audio guide	аудиогид
1285	4	map	карта
1286	4	guidebook	путеводитель
1287	4	souvenir	сувенир
1288	4	postcard	открытка
1289	4	to get lost	заблудиться
1290	4	directions	направление, как пройти
1291	4	street sign	дорожный знак
1292	4	corner	угол
1293	4	roundabout	круговое движение
1294	4	crossroads	перекрёсток
1295	4	pedestrian crossing	пешеходный переход
1296	4	traffic lights	светофор
1297	4	on the left	слева
1298	4	on the right	справа
1299	4	straight ahead	прямо
1300	4	across the street	через дорогу
1301	4	opposite	напротив
1302	4	next to	рядом с
1303	4	nearby	поблизости
1304	4	far away	далеко
1305	4	public transport	общественный транспорт
1306	4	bus stop	автобусная остановка
1307	4	bus station	автобусный вокзал
1308	4	train station	железнодорожный вокзал
1309	4	underground	метро
1310	4	subway	метро
1311	4	tram	трамвай
1312	4	ferry	паром
1313	4	taxi rank	стоянка такси
1314	4	ticket machine	автомат по продаже билетов
1315	4	ticket office	касса
1316	4	platform	платформа
1317	4	return ticket	билет туда‑обратно
1318	4	single ticket	билет в одну сторону
1319	4	day pass	дневной проездной
1320	4	monthly pass	месячный проездной
1321	4	rush hour	час пик
1322	4	off-peak	нечас пик
1323	4	car rental	аренда машины
1324	4	rent a car	арендовать машину
1325	4	driving licence	водительские права
1326	4	petrol station	заправка
1327	4	speed limit	ограничение скорости
1328	4	traffic jam	пробка
1329	4	parking lot	парковка
1330	4	parking ticket	штраф за парковку
1331	4	seatbelt fine	штраф за ремень
1332	4	road trip	автопутешествие
1333	4	hostel dorm	общий номер в хостеле
1334	4	bunk bed	двухъярусная кровать
1335	4	locker	шкафчик для вещей
1336	4	curfew	комендантский час
1337	4	shared bathroom	общая ванная
1338	4	shared kitchen	общая кухня
1339	4	travel buddy	попутчик
1340	4	travel blog	путешественнический блог
1341	4	travel vlog	влог о путешествиях
1342	4	budget travel	бюджетное путешествие
1343	4	backpacking	бэкпэкинг, путешествие с рюкзаком
1344	4	hostel review	отзыв о хостеле
1345	4	overbooked flight	перепроданный рейс
1346	4	upgrade	повышение класса (номера, билета)
1347	4	downgrade	понижение класса
1348	4	jet lag	дискомфорт от смены часовых поясов
1349	4	time zone	часовой пояс
1350	4	local time	местное время
1351	4	currency	валюта
1352	4	exchange rate	обменный курс
1353	4	money exchange	обмен валюты
1354	4	foreign currency	иностранная валюта
1355	4	credit card fee	комиссия за оплату картой
1356	4	budget	бюджет
1357	4	travel budget	бюджет поездки
1358	4	souvenir shop	сувенирный магазин
1359	4	tourist trap	место, рассчитанное на туристов
1360	4	local market	местный рынок
1361	4	street food	уличная еда
1362	4	food stall	уличная точка с едой
1363	4	tip	чаевые
1364	4	service charge	обслуживание (в счёте)
1365	4	reservation for dinner	бронь на ужин
1366	4	dietary restrictions	ограничения в питании
1367	4	vegetarian option	вегетарианский вариант
1368	4	allergy warning	предупреждение об аллергии
1369	4	tap water safe	безопасная вода из-под крана
1370	4	bottle of water	бутылка воды
1371	4	pharmacy nearby	аптека поблизости
1372	4	travel sickness	укачивание
1373	4	first aid kit	аптечка первой помощи
1374	4	emergency number	номер экстренной службы
1375	4	police station	полицейский участок
1376	4	embassy	посольство
1377	4	consulate	консульство
1378	4	travel warning	предупреждение для поездок
1379	4	safety instructions	инструкции по безопасности
1380	4	Wi‑Fi password	пароль от Wi‑Fi
1381	4	roaming charges	роуминговые тарифы
1382	4	SIM card	SIM‑карта
1383	4	data plan	пакет мобильного интернета
1384	4	offline map	офлайн‑карта
1385	4	translation app	приложение‑переводчик
1386	4	power adapter	сетевой адаптер
1387	4	plug type	тип розетки
1388	4	voltage	напряжение
1389	4	travel pillow	дорожная подушка
1390	4	earplugs	беруши
1391	4	sleep mask	маска для сна
1392	4	hand sanitizer	антисептик для рук
1393	4	wet wipes	влажные салфетки
1394	4	carry-on liquids	жидкости в ручной клади
1395	4	baggage allowance	норма провоза багажа
1396	4	overweight baggage	перевес багажа
1397	4	fragile	хрупкий
1398	4	handle with care	обращаться осторожно
1399	4	travel documents	дорожные документы
1400	4	booking confirmation	подтверждение брони
1401	4	check-in online	онлайн‑регистрация
1402	4	seat selection	выбор места
1403	4	travel companion	попутчик
1404	4	group tour	групповой тур
1405	4	package holiday	турпакет, пакетный тур
1406	4	solo travel	путешествие в одиночку
1407	4	gap year	год перерыва для путешествий
1408	4	local culture	местная культура
1409	4	local customs	местные обычаи
1410	4	language barrier	языковой барьер
1411	4	small talk	непринуждённая беседа
1412	4	host family dinner	ужин с принимающей семьёй
1413	4	photo spot	место для фото
1414	4	travel memory	воспоминание о поездке
1415	4	post-travel depression	грусть после поездки
1423	5	stakeholder	заинтересованная сторона
1424	5	shareholder	акционер
1425	5	equity	собственный капитал, доля
1426	5	liquidity	ликвидность
1427	5	solvency	платёжеспособность
1428	5	leverage	кредитное плечо, заёмные средства
1429	5	asset	актив
1430	5	liability	пассив, обязательство
1431	5	intangible assets	нематериальные активы
1432	5	goodwill	деловая репутация (гудвилл)
1433	5	benchmark	эталон, ориентир для сравнения
1434	5	break-even point	точка безубыточности
1435	5	cash flow	денежный поток
1436	5	overheads	накладные расходы
1437	5	capital expenditure	капитальные затраты
1438	5	operating costs	операционные расходы
1439	5	profit margin	уровень рентабельности, маржа
1440	5	return on investment	окупаемость инвестиций
1441	5	return on equity	рентабельность собственного капитала
1442	5	dividend	дивиденд
1443	5	portfolio	инвестиционный портфель
1444	5	securities	ценные бумаги
1445	5	bond	облигация
1446	5	share issue	выпуск акций
1447	5	initial public offering	первичное размещение акций (IPO)
1448	5	shareholder value	стоимость для акционеров
1449	5	corporate governance	корпоративное управление
1450	5	compliance	соблюдение нормативных требований
1451	5	regulatory framework	нормативно-правовая база
1452	5	disclosure	раскрытие информации
1453	5	transparency	прозрачность
1454	5	due diligence	юридическая и финансовая проверка
1455	5	confidentiality agreement	соглашение о конфиденциальности
1456	5	non-compete clause	условие о неконкуренции
1457	5	severance package	компенсационный пакет при увольнении
1458	5	golden handshake	щедрое выходное пособие
1459	5	golden parachute	особо выгодные условия увольнения топ-менеджера
1460	5	share option	опцион на акции
1461	5	stock option plan	опционная программа для сотрудников
1462	5	performance bonus	премия за результаты
1463	5	incentive scheme	система материального поощрения
1464	5	fringe benefits	дополнительные льготы
1465	5	remuneration package	пакет вознаграждения
1466	5	headhunter	рекрутер высшего уровня, «охотник за головами»
1467	5	succession planning	планирование преемственности
1468	5	turnover rate	уровень текучести кадров
1469	5	career development	развитие карьеры
1470	5	professional growth	профессиональный рост
1471	5	onboarding	ввод в должность, адаптация новых сотрудников
1472	5	offboarding	вывод сотрудника из компании
1473	5	mentorship	наставничество
1474	5	empowerment	делегирование полномочий, расширение прав
1475	5	accountability	подотчётность
1476	5	span of control	диапазон контроля (число подчинённых)
1477	5	hierarchical structure	иерархическая структура
1478	5	flat structure	плоская структура управления
1479	5	matrix organization	матричная структура организации
1480	5	chain of command	цепочка подчинения
1481	5	reporting line	линия подчинённости
1482	5	middle management	среднее звено управления
1483	5	senior management	руководство высшего звена
1484	5	board of directors	совет директоров
1485	5	executive committee	правление, исполнительный комитет
1486	5	Chief Executive Officer	генеральный директор (CEO)
1487	5	Chief Financial Officer	финансовый директор (CFO)
1488	5	Chief Operating Officer	операционный директор (COO)
1489	5	Chief Technology Officer	технический директор (CTO)
1490	5	strategic objectives	стратегические цели
1491	5	long-term vision	долгосрочное видение
1492	5	corporate mission	миссия компании
1493	5	core values	ключевые ценности
1494	5	value proposition	ценностное предложение
1495	5	competitive advantage	конкурентное преимущество
1496	5	sustainable growth	устойчивый рост
1497	5	market penetration	проникновение на рынок
1498	5	market expansion	расширение рынка
1499	5	emerging markets	развивающиеся рынки
1500	5	market saturation	насыщенность рынка
1501	5	brand awareness	узнаваемость бренда
1502	5	brand loyalty	лояльность к бренду
1503	5	brand equity	стоимость бренда
1504	5	positioning	позиционирование
1505	5	segmentation	сегментация рынка
1506	5	target segment	целевой сегмент
1507	5	niche market	узкий сегмент рынка
1508	5	value chain	цепочка создания стоимости
1509	5	supply chain	цепочка поставок
1510	5	distribution channel	канал распределения
1511	5	wholesale	оптовая торговля
1512	5	retail	розничная торговля
1513	5	franchise	франшиза
1514	5	franchisee	франчайзи, покупатель франшизы
1515	5	franchisor	франчайзер, владелец франшизы
1516	5	outsourcing	аутсорсинг
1517	5	offshoring	перенос операций за рубеж
1518	5	benchmarking	сравнительный анализ (бенчмаркинг)
1519	5	best practice	лучшая практика
1520	5	industry standard	отраслевой стандарт
1521	5	key performance indicator	ключевой показатель эффективности
1522	5	deliverables	ожидаемые результаты, «deliverables»
1523	5	milestone	важный этап проекта
1524	5	timeframe	сроки выполнения
1525	5	resource allocation	распределение ресурсов
1526	5	contingency plan	план на случай непредвиденных обстоятельств
1527	5	risk assessment	оценка рисков
1528	5	risk mitigation	снижение рисков
1529	5	feasibility study	исследование осуществимости проекта
1530	5	stakeholder engagement	вовлечение заинтересованных сторон
1531	5	buy-in	поддержка со стороны участников
1532	5	alignment	согласованность, выравнивание интересов
1533	5	synergy	синергия
1534	5	diversification	диверсификация
1535	5	downsizing	сокращение штата
1536	5	restructuring	реструктуризация
1537	5	streamlining	оптимизация процессов
1538	5	turnaround	вывод компании из кризиса
1539	5	corporate culture	корпоративная культура
1540	5	work-life balance	баланс работа–жизнь
1541	5	employee engagement	вовлечённость сотрудников
1542	5	employee retention	удержание сотрудников
1543	5	burnout	профессиональное выгорание
1544	5	workload	нагрузка
1545	5	flexible working hours	гибкий график работы
1546	5	remote work policy	политика удалённой работы
1547	5	performance appraisal	оценка результативности
1548	5	constructive feedback	конструктивная обратная связь
1549	5	conflict resolution	урегулирование конфликтов
1550	5	mediation	медиация
1551	5	negotiation skills	навыки ведения переговоров
1552	5	win-win solution	обоюдовыгодное решение
1553	5	bargaining power	переговорная сила
1554	5	leverage in negotiations	рычаги влияния в переговорах
1555	5	concession	уступка
1556	5	counteroffer	встречное предложение
1557	5	memorandum of understanding	протокол о намерениях
1558	5	binding contract	обязательный к исполнению контракт
1559	5	non-binding agreement	необязательное соглашение
1560	5	breach of contract	нарушение договора
1561	5	liquidated damages	оговорённые договором убытки
1562	5	arbitration	арбитраж
1563	5	litigation	судебное разбирательство
1564	5	settlement	урегулирование спора
1565	5	out-of-court settlement	досудебное урегулирование
1566	5	intellectual property rights	права интеллектуальной собственности
1567	5	patent infringement	нарушение патентных прав
1568	5	copyright infringement	нарушение авторских прав
1569	5	trademark registration	регистрация торговой марки
1570	5	licensing agreement	лицензионное соглашение
1571	5	royalties	роялти, лицензионные отчисления
1572	5	brand recognition	узнаваемость бренда
1573	5	corporate identity	фирменный стиль
1574	5	corporate social responsibility	корпоративная социальная ответственность (CSR)
1575	5	sustainability strategy	стратегия устойчивого развития
1576	5	environmental impact	воздействие на окружающую среду
1577	5	carbon footprint	углеродный след
1578	5	ethical sourcing	этичные поставки
1579	5	fair trade	справедливая торговля
1580	5	whistleblower	осведомитель, сообщающий о нарушениях
1581	5	insider trading	внутренняя торговля акциями
1582	5	fraud prevention	предотвращение мошенничества
1583	5	anti-bribery policy	политика против взяточничества
1584	5	code of conduct	кодекс поведения
1585	5	corporate scandal	корпоративный скандал
1586	5	reputation management	управление репутацией
1587	5	crisis communication	антикризисные коммуникации
1588	5	public relations campaign	PR‑кампания
1589	5	media coverage	освещение в СМИ
1590	5	press release	пресс-релиз
1591	5	share price	курс акций
1592	5	market volatility	волатильность рынка
1593	5	economic downturn	спад в экономике
1594	5	recession	рецессия
1595	5	boom and bust cycle	циклы подъёма и спада
1596	5	emerging economy	развивающаяся экономика
1597	5	developed market	развитый рынок
1598	5	currency fluctuation	колебания валютного курса
1599	5	exchange-rate risk	валютный риск
1600	5	hedging strategy	стратегия хеджирования
1601	5	derivatives	деривативы, производные финансовые инструменты
1602	5	futures contract	фьючерсный контракт
1603	5	options trading	торговля опционами
1604	5	speculative investment	спекулятивные инвестиции
1605	5	blue-chip company	«голубая фишка», надёжная крупная компания
1606	5	start-up ecosystem	экосистема стартапов
1607	5	venture capital	венчурный капитал
1608	5	angel investor	бизнес-ангел
1609	5	seed funding	посевное финансирование
1610	5	scalability	масштабируемость
1611	5	business model	бизнес-модель
1612	5	value-added services	дополнительные услуги с высокой ценностью
1613	5	customer acquisition	привлечение клиентов
1614	5	customer retention	удержание клиентов
1615	5	churn rate	уровень оттока клиентов
1616	5	conversion rate	коэффициент конверсии
1617	5	user engagement	вовлечённость пользователей
1618	5	data-driven decisions	решения на основе данных
1619	5	key metrics	ключевые метрики
1620	5	dashboard	панель показателей, дэшборд
1621	5	forecasting	прогнозирование
1622	5	scenario planning	планирование сценариев
1623	5	business continuity plan	план обеспечения непрерывности бизнеса
1624	5	disruption	сбой, нарушение работы
1625	5	disruptive innovation	подрывная инновация
1626	5	digital transformation	цифровая трансформация
1627	5	automation	автоматизация
1628	5	workflow	рабочий процесс
1629	5	bottleneck	узкое место в процессе
1630	5	scalable solution	масштабируемое решение
1631	5	cloud-based platform	облачная платформа
1632	5	software as a service	ПО как услуга (SaaS)
1633	5	business intelligence	бизнес‑аналитика
1634	5	data warehouse	хранилище данных
1635	5	compliance audit	аудит на соответствие требованиям
1636	5	internal audit	внутренний аудит
1637	5	external auditor	внешний аудитор
1638	5	cost-effective	экономически эффективный
1639	5	economies of scale	эффект масштаба
1640	5	high-end segment	премиальный сегмент
1641	5	low-cost segment	низкобюджетный сегмент
1642	5	market positioning	позиционирование на рынке
1643	5	brand extension	расширение линейки бренда
1644	5	rebranding	ребрендинг
1645	5	product lifecycle	жизненный цикл продукта
1646	5	launch phase	этап запуска
1647	5	growth phase	этап роста
1648	5	maturity phase	этап зрелости
1649	5	decline phase	этап спада
1650	5	pilot project	пилотный проект
1651	5	rollout	поэтапное развёртывание
1652	5	proof of concept	доказательство концепции
1653	5	return on time invested	окупаемость затраченного времени
1654	5	overcommitment	чрезмерное количество обязательств
1655	5	workload management	управление нагрузкой
1656	5	prioritization	расстановка приоритетов
1657	6	long-haul flight	дальний перелёт
1658	6	red-eye flight	ночной рейс
1659	6	stopover	короткая остановка в пути, стыковка
1660	6	layover	пересадка, остановка между рейсами
1661	6	jet lag	дискомфорт от смены часовых поясов
1662	6	travel fatigue	усталость от путешествия
1663	6	peak season	высокий сезон
1664	6	off-season	низкий сезон
1665	6	shoulder season	межсезонье
1666	6	fully-booked	полностью забронированный
1667	6	overbooked	переполненный, перепроданный (рейс, отель)
1668	6	standby passenger	пассажир в листе ожидания
1669	6	upgrade to business class	повысить класс до бизнес
1670	6	downgraded seat	пониженный класс места
1671	6	all-inclusive resort	отель по системе «всё включено»
1672	6	boutique hotel	бутик-отель
1673	6	luxury accommodation	роскошное жильё
1674	6	budget accommodation	бюджетное жильё
1675	6	self-catering apartment	апартаменты с собственной кухней
1676	6	homestay	проживание в семье
1677	6	bed and breakfast	гостевой дом с завтраком
1678	6	dormitory room	комната в общежитии, общая спальня
1679	6	twin room	номер с двумя отдельными кроватями
1680	6	en-suite bathroom	ванная комната в номере
1681	6	room upgrade	улучшение категории номера
1682	6	late check-out fee	доплата за поздний выезд
1683	6	no-show fee	штраф за незаезд
1684	6	overseas trip	поездка за границу
1685	6	border crossing	пересечение границы
1686	6	passport control queue	очередь на паспортный контроль
1687	6	customs declaration	таможенная декларация
1688	6	duty-free shop	магазин duty free
1689	6	excess baggage fee	сбор за перевес багажа
1690	6	fragile luggage	хрупкий багаж
1691	6	lost luggage claim	заявление о утерянном багаже
1692	6	travel compensation	компенсация за поездку
1693	6	travel voucher	путевой ваучер
1694	6	emergency exit row	ряд у аварийного выхода
1695	6	priority boarding	приоритетная посадка
1696	6	fast track security	быстрый коридор на досмотр
1697	6	airport lounge	бизнес‑зал в аэропорту
1698	6	frequent flyer	часто летающий пассажир
1699	6	loyalty programme	программа лояльности
1700	6	mileage points	мили, бонусные баллы
1701	6	redeem points	потратить бонусные баллы
1702	6	travel itinerary	подробный маршрут поездки
1703	6	tailor-made tour	индивидуальный тур
1704	6	guided excursion	экскурсия с гидом
1705	6	package holiday	пакетный тур
1706	6	city break	короткий отдых в другом городе
1707	6	weekend getaway	уикенд‑поездка
1708	6	road trip	автопутешествие
1709	6	camping site	кемпинг
1710	6	glamping	глэмпинг, «шикарный» кемпинг
1711	6	backpacking trip	путешествие с рюкзаком
1712	6	trekking expedition	поход‑экспедиция
1713	6	sightseeing tour	экскурсионная поездка
1714	6	hop-on hop-off bus	туристический автобус с высадкой/посадкой где угодно
1715	6	touristy area	чрезмерно туристическое место
1716	6	off the beaten track	вдали от туристических мест
1717	6	remote destination	отдалённое направление
1718	6	far-flung destination	затерянное, далёкое место
1719	6	secluded beach	уединённый пляж
1720	6	hidden gem	скрытая жемчужина, малоизвестное классное место
1721	6	breathtaking scenery	захватывающие дух пейзажи
1722	6	picturesque village	живописная деревня
1723	6	quaint town	колоритный старинный городок
1724	6	vibrant nightlife	живописная, активная ночная жизнь
1725	6	cultural landmarks	культурные достопримечательности
1726	6	historic monument	исторический памятник
1727	6	heritage site	объект культурного наследия
1728	6	UNESCO World Heritage	объект Всемирного наследия ЮНЕСКО
1729	6	local customs	местные обычаи
1730	6	cultural shock	культурный шок
1731	6	culture exchange	культурный обмен
1732	6	immersive experience	полное погружение в опыт
1733	6	authentic experience	аутентичный опыт
1734	6	bucket list destination	место из «списка мечты»
1735	6	once-in-a-lifetime trip	поездка раз в жизни
1736	6	transformational travel	путешествие, меняющее жизнь
1737	6	slow travel	медленное, размеренное путешествие
1738	6	solo traveller	путешественник в одиночку
1739	6	digital nomad	цифровой кочевник
1740	6	co-working space	коворкинг
1741	6	remote lifestyle	удалённый образ жизни
1742	6	travel blogger	 тревел‑блогер
1743	6	travel influencer	тревел‑инфлюенсер
1744	6	travel vlog	тревел‑влог
1745	6	budget airline	лоукост‑авиакомпания
1746	6	hidden fees	скрытые сборы
1747	6	non-refundable ticket	невозвратный билет
1748	6	flexible ticket	гибкий билет (можно менять)
1749	6	travel ban	запрет на поездки
1750	6	entry requirements	въездные требования
1751	6	visa-free entry	безвизовый въезд
1752	6	multiple-entry visa	многократная виза
1753	6	single-entry visa	однократная виза
1754	6	visa extension	продление визы
1755	6	overstaying a visa	превышение срока визы
1756	6	immigration officer	сотрудник иммиграционной службы
1757	6	proof of funds	подтверждение наличия средств
1758	6	onward ticket	билет дальше (из страны)
1759	6	trip cancellation	отмена поездки
1760	6	trip interruption	прерывание поездки
1761	6	medical coverage	медицинское покрытие (страховки)
1762	6	evacuation insurance	страховка на эвакуацию
1763	6	travel advisory	официальное предупреждение для путешествий
1764	6	safety precautions	меры предосторожности
1765	6	pickpocketing	карманные кражи
1766	6	scam	мошенничество
1767	6	unwary tourist	неосторожный турист
1768	6	local cuisine	местная кухня
1769	6	street vendor	уличный продавец
1770	6	food poisoning	пищевое отравление
1771	6	bottled water only	пить только бутилированную воду
1772	6	dietary restrictions	ограничения в питании
1773	6	vegetarian-friendly	подходящий для вегетарианцев
1774	6	all-inclusive buffet	шведский стол «всё включено»
1775	6	room upgrade request	запрос на улучшение номера
1776	6	complimentary breakfast	бесплатный завтрак
1777	6	wake-up call service	услуга звонка‑будильника
1778	6	late-night check-in	поздний заезд
1779	6	24-hour reception	круглосуточная стойка регистрации
1780	6	shared dorm	общий номер (в хостеле)
1781	6	mixed dorm	смешанный общий номер
1782	6	female-only dorm	женский общий номер
1783	6	noise complaint	жалоба на шум
1784	6	curfew time	время закрытия, комендантский час
1785	6	hostel rules	правила хостела
1786	6	airport pickup	забор из аэропорта
1787	6	shuttle service	шаттл‑сервис
1788	6	meet-and-greet	встреча с табличкой
1789	6	car-sharing	каршеринг
1790	6	ride-hailing app	приложение для заказа такси
1791	6	surge pricing	повышенный тариф
1792	6	seat reservation	резервация места
1793	6	overcrowded train	переполненный поезд
1794	6	compartment	купе
1795	6	sleeper cabin	спальный вагон
1796	6	overnight train	ночной поезд
1797	6	scenic route	живописный маршрут
1798	6	detour	объезд
1799	6	traffic congestion	затор, перегруженность дорог
1800	6	driving abroad	вождение за рубежом
1801	6	international driving permit	международное водительское удостоверение
1802	6	full coverage insurance	полное страховое покрытие
1803	6	fuel-efficient car	экономичная машина
1804	6	toll road	платная дорога
1805	6	roadside assistance	дорожная помощь
1806	6	scenic overlook	смóтровая площадка у дороги
1807	6	travel photography	тревел‑фотография
1808	6	photo opportunity	удачный момент для фото
1809	6	sunset spot	место для заката
1810	6	crowded viewpoint	переполненная смотровая
1811	6	off-peak hours	непиковые часы
1812	6	travel buddy	товарищ по путешествию
1813	6	shared expenses	общие расходы
1814	6	split the bill	делить счёт
1815	6	language barrier	языковой барьер
1816	6	miscommunication	недопонимание
1817	6	translation app dependency	зависимость от приложения‑переводчика
1818	6	gesture communication	общение жестами
1819	6	homestay host	принимающий хозяин (семья)
1820	6	cultural sensitivity	культурная чувствительность
1821	6	dress code	дресс‑код
1822	6	religious site etiquette	этикет в религиозных местах
1823	6	tipping etiquette	традиции чаевых
1824	6	overcrowded tourist spot	переполненная достопримечательность
1825	6	overtourism	чрезмерный туризм
1826	6	sustainable tourism	устойчивый туризм
1827	6	eco-friendly accommodation	экологичное жильё
1828	6	carbon offset	компенсация углеродного следа
1829	6	local community support	поддержка местного сообщества
1830	6	responsible traveller	ответственный путешественник
1831	6	voluntourism	волонтёрский туризм
1832	6	wildlife tourism	туризм, связанный с дикой природой
1833	6	ethical wildlife experience	этичное взаимодействие с животными
1834	6	environmental impact	воздействие на окружающую среду
1835	6	travel restrictions	ограничения на поездки
1836	6	quarantine requirements	требования карантина
1837	6	health declaration form	медицинская декларация
1838	6	PCR test requirement	требование ПЦР‑теста
1839	6	travel corridor	зелёный коридор для поездок
1840	6	contactless check-in	бесконтактный заезд
1841	6	digital boarding pass	цифровой посадочный талон
1842	6	virtual tour	виртуальный тур
1843	6	staycation	отдых дома / в своём городе
1844	6	last-minute deal	горящее предложение
1845	6	early-bird discount	скидка за раннее бронирование
1846	6	non-refundable rate	тариф без возврата
1847	6	flexible cancellation policy	гибкая политика отмены
1848	7	sport	спорт
1849	7	exercise	упражнение
1850	7	training	тренировка
1851	7	practice	тренироваться, практика
1852	7	team	команда
1853	7	player	игрок
1854	7	coach	тренер
1855	7	referee	судья
1856	7	umpire	судья (в теннисе, бейсболе)
1857	7	fan	болельщик
1858	7	spectator	зритель
1859	7	match	матч
1860	7	game	игра
1861	7	competition	соревнование
1862	7	tournament	турнир
1863	7	league	лига
1864	7	championship	чемпионат
1865	7	cup	кубок
1866	7	medal	медаль
1867	7	gold medal	золотая медаль
1868	7	silver medal	серебряная медаль
1869	7	bronze medal	бронзовая медаль
1870	7	victory	победа
1871	7	defeat	поражение
1872	7	win	выигрывать
1873	7	lose	проигрывать
1874	7	draw	ничья
1875	7	score	счёт
1876	7	goal	гол, ворота
1877	7	point	очки, балл
1878	7	result	результат
1879	7	team-mate	товарищ по команде
1880	7	captain	капитан команды
1881	7	opponent	противник
1882	7	rival	соперник
1883	7	athlete	спортсмен
1884	7	professional	профессиональный спортсмен
1885	7	amateur	любитель
1886	7	training session	тренировочное занятие
1887	7	warm-up	разминка
1888	7	cool down	заминка после нагрузки
1889	7	stretching	растяжка
1890	7	fitness	фитнес
1891	7	gym	спортзал
1892	7	gym membership	абонемент в зал
1893	7	workout	тренировка
1894	7	routine	тренировочная программа
1895	7	football	футбол
1896	7	soccer	футбол (американский термин)
1897	7	football pitch	футбольное поле
1898	7	goalkeeper	вратарь
1899	7	defender	защитник
1900	7	midfielder	полузащитник
1901	7	striker	нападающий
1902	7	corner kick	угловой удар
1903	7	free kick	штрафной удар
1904	7	penalty	пенальти
1905	7	foul	нарушение
1906	7	yellow card	жёлтая карточка
1907	7	red card	красная карточка
1908	7	substitute	запасной игрок, замена
1909	7	basketball	баскетбол
1910	7	basketball court	баскетбольная площадка
1911	7	hoop	баскетбольное кольцо
1912	7	dribble	вести мяч (дриблинг)
1913	7	shoot	бросать по кольцу
1914	7	pass	передавать мяч
1915	7	rebound	подбор мяча
1916	7	volleyball	волейбол
1917	7	volleyball court	волейбольная площадка
1918	7	serve	подавать
1919	7	block	блокировать
1920	7	spike	атака сверху, «удар вгвоздь»
1921	7	tennis	теннис
1922	7	tennis court	теннисный корт
1923	7	racket	ракетка
1924	7	tennis ball	теннисный мяч
1925	7	serve	подача
1926	7	backhand	удар слева (бэкхенд)
1927	7	forehand	удар справа (форхенд)
1928	7	table tennis	настольный теннис
1929	7	ping pong	пинг‑понг
1930	7	bat	ракетка (для настольного тенниса)
1931	7	swimming	плавание
1932	7	swimming pool	бассейн
1933	7	lane	дорожка в бассейне
1934	7	freestyle	вольный стиль
1935	7	breaststroke	брасс
1936	7	backstroke	плавание на спине
1937	7	butterfly	баттерфляй
1938	7	running	бег
1939	7	jogging	лёгкий бег
1940	7	track	беговая дорожка
1941	7	race	гонка, забег
1942	7	marathon	марафон
1943	7	sprint	спринт, короткий забег
1944	7	relay race	эстафета
1945	7	cycling	велоспорт
1946	7	bicycle	велосипед
1947	7	helmet	шлем
1948	7	mountain biking	горный велосипед
1949	7	skiing	катание на лыжах
1950	7	ski resort	горнолыжный курорт
1951	7	ski slope	горнолыжный склон
1952	7	ski lift	подъёмник
1953	7	ski boots	лыжные ботинки
1954	7	snowboarding	сноуборд
1955	7	snowboard	сноуборд (доска)
1956	7	ice skating	катание на коньках
1957	7	ice rink	каток
1958	7	hockey	хоккей
1959	7	ice hockey	хоккей на льду
1960	7	stick	клюшка
1961	7	puck	шайба
1962	7	boxing	бокс
1963	7	boxing gloves	боксерские перчатки
1964	7	ring	рин г
1965	7	round	раунд
1966	7	knockout	нокаут
1967	7	martial arts	боевые искусства
1968	7	karate	карате
1969	7	judo	дзюдо
1970	7	taekwondo	таэквондо
1971	7	wrestling	борьба
1972	7	gymnastics	гимнастика
1973	7	rhythmic gymnastics	художественная гимнастика
1974	7	athletics	лёгкая атлетика
1975	7	long jump	прыжок в длину
1976	7	high jump	прыжок в высоту
1977	7	shot put	толкание ядра
1978	7	discus throw	метание диска
1979	7	javelin throw	метание копья
1980	7	rowing	гребля
1981	7	canoeing	гребля на каноэ
1982	7	kayaking	гребля на каяке
1983	7	sailing	парусный спорт
1984	7	surfing	серфинг
1985	7	diving	прыжки в воду / дайвинг
1986	7	climbing	скалолазание
1987	7	rock climbing	скалолазание
1988	7	horse riding	верховая езда
1989	7	golf	гольф
1990	7	golf club	клюшка для гольфа
1991	7	golf course	поле для гольфа
1992	7	cricket	крикет
1993	7	baseball	бейсбол
1994	7	baseball bat	бита для бейсбола
1995	7	rugby	регби
1996	7	American football	американский футбол
1997	7	badminton	бадминтон
1998	7	squash	сквош
1999	7	table football	настольный футбол
2000	7	darts	дартс
2001	7	bowling	боулинг
2002	7	chess	шахматы
2003	7	board games	настольные игры
2004	7	scoreboard	табло
2005	7	trophy	трофей, кубок
2006	7	cup final	финал кубка
2007	7	season	сезон
2008	7	sports season	спортивный сезон
2009	7	sportsman	спортсмен
2010	7	sportswoman	спортсменка
2011	7	sportswear	спортивная одежда
2012	7	trainers	кроссовки
2013	7	running shoes	кроссовки для бега
2014	7	sports equipment	спортивный инвентарь
2015	7	ball	мяч
2016	7	net	сетка
2017	7	goalpost	штанга, стойка ворот
2018	7	whistle	свисток
2019	7	stopwatch	секундомер
2020	7	water bottle	бутылка воды
2021	7	locker room	раздевалка
2022	7	shower	душ
2023	7	bench	скамейка
2024	7	substitutes bench	скамейка запасных
2025	7	home team	хозяева (команда)
2026	7	away team	гости (команда)
2027	7	supporter	болельщик
2028	7	cheer	болеть, поддерживать криками
2029	7	injury	травма
2030	7	sprain	растяжение
2031	7	bruise	синяк
2032	7	broken leg	перелом ноги
2033	7	first aid	первая помощь
2034	7	physiotherapist	физиотерапевт
2035	7	healthy lifestyle	здоровый образ жизни
2036	7	to get fit	прийти в форму
2037	7	to keep fit	поддерживать форму
2038	7	lose weight	сбрасывать вес
2039	7	gain muscle	набирать мышечную массу
2040	7	to join a gym	записаться в спортзал
2041	7	to work out regularly	регулярно тренироваться
2042	7	outdoor sports	уличные виды спорта
2043	7	indoor sports	заловые виды спорта
2044	7	team sports	командные виды спорта
2045	7	individual sports	индивидуальные виды спорта
2046	7	extreme sports	экстремальные виды спорта
2047	7	parkour	паркур
2048	7	skateboarding	скейтбординг
2049	7	BMX	ВМХ-велосипед спорт
2050	7	competition day	день соревнований
2051	7	practice match	товарищеский матч
2052	7	friendly match	товарищеский матч
2053	7	home game	домашний матч
2054	7	away game	выездной матч
2055	7	league table	турнирная таблица
2056	7	playoffs	плей‑офф
2057	7	World Cup	чемпионат мира
2058	7	Olympic Games	Олимпийские игры
2059	7	athletics track	лёгкоатлетический трек
2060	7	sports hall	спортивный зал
2061	7	sports centre	спортивный центр
2062	7	swim cap	шапочка для плавания
2063	7	goggles	очки для плавания
2064	7	shin guards	щитки
2065	7	elbow pads	налокотники
2066	7	knee pads	наколенники
2067	7	mouthguard	каппа
2068	7	helmet strap	ремешок шлема
2069	8	competitive edge	конкурентное преимущество
2070	8	peak performance	пиковая форма, максимум возможностей
2071	8	endurance athlete	выносливый спортсмен (на длинные дистанции)
2072	8	stamina	выносливость
2073	8	agility	ловкость, подвижность
2074	8	coordination	координация
2075	8	explosive power	взрывная сила
2076	8	strength conditioning	силовая подготовка
2077	8	cardiovascular fitness	выносливость сердечно‑сосудистой системы
2078	8	high-intensity interval training	интервальная высокоинтенсивная тренировка
2079	8	recovery session	восстановительная тренировка
2080	8	warm-up routine	разминка как комплекс упражнений
2081	8	cool-down exercises	упражнения на заминку
2082	8	overtraining syndrome	синдром перетренированности
2083	8	muscle soreness	крепатура
2084	8	sports injury	спортивная травма
2085	8	recurring injury	повторяющаяся травма
2086	8	ligament tear	разрыв связки
2087	8	cartilage damage	повреждение хряща
2088	8	concussion protocol	протокол по сотрясениям мозга
2089	8	rehab program	программа реабилитации
2090	8	physio session	сеанс у физиотерапевта
2091	8	sports massage	спортивный массаж
2092	8	performance-enhancing drugs	допинг, препараты для улучшения результатов
2093	8	drug test	допинг‑тест
2094	8	to ban an athlete	дисквалифицировать спортсмена
2095	8	lifetime ban	пожизненная дисквалификация
2096	8	sportsmanship	честная игра, спортивный дух
2097	8	fair play	честная игра
2098	8	foul play	грязная игра, нарушение правил
2099	8	unsportsmanlike behaviour	неспортсменское поведение
2100	8	to cheat	жульничать, нарушать правила
2101	8	match-fixing	договорной матч
2102	8	crowd trouble	беспорядки среди болельщиков
2103	8	hooliganism	хулиганство (болельщиков)
2104	8	home crowd	домашние болельщики
2105	8	hostile atmosphere	враждебная атмосфера
2106	8	electric atmosphere	заряженная, напряжённая атмосфера
2107	8	stadium capacity	вместимость стадиона
2108	8	sold-out game	матч с полностью распроданными билетами
2109	8	season ticket holder	владелец абонемента
2110	8	die-hard fan	ярый фанат
2111	8	neutral supporter	нейтральный болельщик
2112	8	local derby	дерби, матч принципиальных соперников из одного региона
2113	8	bitter rivalry	жесткое соперничество
2114	8	underdog	аутсайдер, от которого не ждут победы
2115	8	favourite	фаворит
2116	8	title contender	претендент на титул
2117	8	dark horse	«тёмная лошадка», неожиданный претендент
2118	8	to dominate the game	доминировать в игре
2119	8	to be outplayed	оказаться переигранным
2120	8	one-sided match	односторонний матч
2121	8	closely-fought game	упорный матч
2122	8	to take the lead	выйти вперёд
2123	8	to regain the lead	вернуть лидерство
2124	8	to extend the lead	увеличить отрыв
2125	8	to close the gap	сократить отставание
2126	8	to equalise	сравнять счёт
2127	8	last-minute winner	победный гол в последние минуты
2128	8	dramatic comeback	драматичное возвращение в игру
2129	8	to mount a comeback	устроить камбэк, отыграться
2130	8	to blow a lead	потерять преимущество в счёте
2131	8	to throw away a chance	упустить шанс
2132	8	to squander opportunities	растратить возможности
2133	8	to miss a sitter	не забить с очевидной позиции
2134	8	to be in top form	быть в отличной форме
2135	8	to be off form	быть не в форме
2136	8	slump in form	падение формы
2137	8	run of good form	серия хорошей формы
2138	8	losing streak	серия поражений
2139	8	winning streak	серия побед
2140	8	to qualify for the finals	квалифицироваться в финал
2141	8	knockout stage	стадия плей‑офф
2142	8	group stage	групповой этап
2143	8	to be knocked out	вылететь (из турнира)
2144	8	to advance to the next round	пройти в следующий раунд
2145	8	quarter-final	четвертьфинал
2146	8	semi-final	полуфинал
2147	8	runner-up	второе место, финалист‑проигравший
2148	8	 title holder	действующий чемпион
2149	8	defending champion	защищающий титул чемпион
2150	8	to retain the title	сохранить титул
2151	8	to clinch the title	выиграть титул
2152	8	record-breaking performance	рекордный результат
2153	8	personal best	личный рекорд
2154	8	world record	мировой рекорд
2155	8	to set a new record	установить новый рекорд
2156	8	to break a record	побить рекорд
2157	8	to hold a record	держать рекорд
2158	8	season opener	первый матч сезона
2159	8	mid-season break	перерыв в середине сезона
2160	8	relegation zone	зона вылета
2161	8	to be relegated	вылететь в низший дивизион
2162	8	to be promoted	подняться в высший дивизион
2163	8	fixture list	расписание игр
2164	8	congested fixture list	сжатое расписание матчей
2165	8	squad rotation	ротация состава
2166	8	transfer window	трансферное окно
2167	8	transfer fee	трансферная сумма
2168	8	free agent	свободный агент
2169	8	loan deal	аренда игрока
2170	8	contract extension	продление контракта
2171	8	release clause	опция выкупа в контракте
2172	8	club loyalty	преданность клубу
2173	8	sponsorship deal	спонсорский контракт
2174	8	shirt sponsor	спонсор на футболке
2175	8	broadcast rights	права на трансляцию
2176	8	match-day revenue	доход в день матча
2177	8	ticket sales	продажа билетов
2178	8	sports franchise	спортивная франшиза (клуб как бизнес)
2179	8	grassroots sport	массовый спорт, «с низов»
2180	8	youth academy	молодёжная академия
2181	8	talent scout	скаут, ищущий таланты
2182	8	to nurture young talent	воспитывать молодые таланты
2183	8	to retire from sport	закончить спортивную карьеру
2184	8	comeback from retirement	возвращение после завершения карьеры
2185	8	ageing player	стареющий игрок
2186	8	veteran player	ветеран, опытный игрок
2187	8	crowd favourite	любимец публики
2188	8	neutral venue	нейтральное поле
2189	8	away section	гостевой сектор
2190	8	to boo the referee	свистеть в адрес судьи
2191	8	controversial decision	спорное решение
2192	8	video assistant referee	видеоассистент судьи (VAR)
2193	8	slow-motion replay	повтор в замедленной съёмке
2194	8	line judge	линейный судья
2195	8	offside trap	ловушка офсайда
2196	8	counter-attack	контратака
2197	8	defensive tactics	оборонительная тактика
2198	8	attacking football	атакующая игра
2199	8	possession game	игра в контроль мяча
2200	8	set piece	стандартное положение (штрафной, угловой)
2201	8	close marking	плотная опека
2202	8	space awareness	чувство пространства на поле
2203	8	wing play	игра через фланги
2204	8	overlap run	подключение защитника в атаку
2205	8	man-to-man marking	персональная опека
2206	8	zonal marking	зонная защита
2207	8	high press	агрессивный прессинг высоко
2208	8	counter-pressing	контрпрессинг
2209	8	fitness coach	тренер по физподготовке
2210	8	technical skills	технические навыки
2211	8	tactical awareness	тактическое понимание
2212	8	match fitness	игровая форма
2213	8	pre-season training	предсезонная подготовка
2214	8	friendly fixture	товарищеский матч
2215	8	sports commentator	спортивный комментатор
2216	8	post-match interview	послематчевое интервью
2217	8	highlights	лучшие моменты матча
2218	8	match analysis	разбор матча
2219	8	to live up to expectations	оправдать ожидания
2220	8	to fall short of expectations	не оправдать ожиданий
2221	8	to silence the critics	заставить критиков замолчать
2222	8	to prove the doubters wrong	доказать скептикам, что они ошибались
2223	8	clutch player	игрок, который решает в важные моменты
2224	8	to choke under pressure	сломаться под давлением
2225	8	to step up	выступить на высшем уровне в важный момент
2226	8	to rise to the occasion	подняться на высоту ситуации
2227	8	to be at the top of your game	быть в лучшей своей форме
2228	8	to be off your game	играть хуже обычного
2229	8	to run rings around someone	играть намного лучше соперника
2230	8	to leave someone in the dust	оставить кого‑то далеко позади
2231	8	to be on the bench	оставаться в запасе
2232	8	to get a call-up	получить вызов в команду / сборную
2233	8	international cap	матч за сборную (кап)
2234	8	club level	уровень клуба
2235	8	international level	уровень сборной
2236	8	sports venue	спортивная арена
2237	8	indoor arena	крытая арена
2238	8	outdoor stadium	открытый стадион
2239	9	politics	политика (сфера)
2240	9	political	политический
2241	9	politician	политик
2242	9	policy	политика, курс действий
2243	9	government	правительство
2244	9	state	государство
2245	9	country	страна
2246	9	nation	нация, страна
2247	9	capital city	столица
2248	9	citizen	гражданин
2249	9	society	общество
2250	9	public	общественность
2251	9	public opinion	общественное мнение
2252	9	law	закон
2253	9	rule	правило
2254	9	constitution	конституция
2255	9	rights	права
2256	9	human rights	права человека
2257	9	freedom	свобода
2258	9	equality	равенство
2259	9	justice	справедливость
2260	9	democracy	демократия
2261	9	dictatorship	диктатура
2262	9	monarchy	монархия
2263	9	republic	республика
2264	9	king	король
2265	9	queen	королева
2266	9	president	президент
2267	9	prime minister	премьер‑министр
2268	9	minister	министр
2269	9	mayor	мэр
2270	9	parliament	парламент
2271	9	congress	конгресс
2272	9	senate	сенат
2273	9	member of parliament	член парламента (MP)
2274	9	representative	представитель
2275	9	local government	местное самоуправление
2276	9	council	совет (городской и т.п.)
2277	9	party	партия
2278	9	political party	политическая партия
2279	9	opposition	оппозиция
2280	9	supporter	сторонник, сторонник партии
2281	9	left-wing	левый (политически)
2282	9	right-wing	правый (политически)
2283	9	centre	центр (умеренные)
2284	9	election	выборы
2285	9	vote	голосовать / голос
2286	9	voter	избиратель
2287	9	to elect	избирать
2288	9	candidate	кандидат
2289	9	campaign	кампания
2290	9	election campaign	предвыборная кампания
2291	9	to run for president	баллотироваться в президенты
2292	9	to win the election	выиграть выборы
2293	9	to lose the election	проиграть выборы
2294	9	ballot	бюллетень для голосования
2295	9	polling station	избирательный участок
2296	9	polls	выборы, голосование; опросы
2297	9	opinion poll	опрос общественного мнения
2298	9	majority	большинство
2299	9	minority	меньшинство
2300	9	coalition	коалиция
2301	9	term in office	срок полномочий
2302	9	to resign	уйти в отставку
2303	9	to step down	уйти с поста
2304	9	corruption	коррупция
2305	9	bribe	взятка
2306	9	scandal	скандал
2307	9	political scandal	политический скандал
2308	9	war	война
2309	9	peace	мир
2310	9	army	армия
2311	9	soldier	солдат
2312	9	conflict	конфликт
2313	9	border	граница
2314	9	treaty	договор (международный)
2315	9	agreement	соглашение
2316	9	international relations	международные отношения
2317	9	embassy	посольство
2318	9	diplomat	дипломат
2319	9	foreign policy	внешняя политика
2320	9	domestic policy	внутренняя политика
2321	9	tax	налог
2322	9	budget	бюджет
2323	9	public services	госуслуги
2324	9	healthcare system	система здравоохранения
2325	9	education system	система образования
2326	9	social security	социальная защита
2327	9	welfare	соцобеспечение, благосостояние
2328	9	unemployment	безработица
2329	9	poverty	бедность
2330	9	crime	преступность
2331	9	police	полиция
2332	9	court	суд
2333	9	judge	судья
2334	9	lawyer	юрист, адвокат
2335	9	constitution court	конституционный суд
2336	9	protest	протест
2337	9	demonstration	демонстрация
2338	9	strike	забастовка
2339	9	human rights organisation	правозащитная организация
2340	9	non-governmental organisation	некоммерческая организация (NGO)
2341	9	freedom of speech	свобода слова
2342	9	freedom of press	свобода прессы
2343	9	censorship	цензура
2344	9	media	СМИ
2345	9	journalist	журналист
2346	9	news report	новостной репортаж
2347	9	public debate	общественная дискуссия
2348	10	sovereignty	суверенитет
2349	10	separation of powers	разделение властей
2350	10	checks and balances	система сдержек и противовесов
2351	10	rule of law	верховенство закона
2352	10	legislature	законодательная власть
2353	10	executive branch	исполнительная власть
2354	10	judiciary	судебная власть
2355	10	bureaucracy	бюрократия, чиновничий аппарат
2356	10	civil service	госслужба
2357	10	public administration	государственное управление
2358	10	constitutional monarchy	конституционная монархия
2359	10	authoritarian regime	авторитарный режим
2360	10	totalitarian state	тоталитарное государство
2361	10	one-party state	однопартийное государство
2362	10	multi-party system	многопартийная система
2363	10	coalition government	коалиционное правительство
2364	10	caretaker government	временное правительство
2365	10	interim government	переходное правительство
2366	10	opposition leader	лидер оппозиции
2367	10	incumbent president	действующий президент
2368	10	lame-duck president	«хромая утка» (уходящий президент)
2369	10	constitutionality	соответствие конституции
2370	10	referendum	референдум
2371	10	plebiscite	плебисцит
2372	10	voter turnout	явка избирателей
2450	10	asylum seeker	соискатель убежища
2373	10	swing voter	колеблющийся избиратель
2374	10	swing state	штат‑«качели», который может изменить исход
2375	10	battleground state	штат, где идёт ожесточённая борьба
2376	10	marginal seat	колеблющийся округ
2377	10	landslide victory	огромная победа с большим отрывом
2378	10	hung parliament	парламент без явного большинства
2379	10	electoral system	избирательная система
2380	10	proportional representation	пропорциональное представительство
2381	10	first-past-the-post	мажоритарная система относительного большинства
2382	10	electoral threshold	избирательный порог
2383	10	gerrymandering	манипуляция границами округов
2384	10	constituency	избирательный округ
2385	10	constituent	избиратель, житель округа
2386	10	campaign finance	финансирование кампании
2387	10	political funding	политическое финансирование
2388	10	lobby	лобби, группа давления
2389	10	lobbyist	лоббист
2390	10	to lobby for a law	лоббировать закон
2391	10	interest group	группа интересов
2392	10	pressure group	группа давления
2393	10	grassroots movement	массовое движение «снизу»
2394	10	civil society	гражданское общество
2395	10	activism	активизм
2396	10	advocacy	отстаивание интересов, адвокация
2397	10	public outrage	общественное возмущение
2398	10	public backlash	общественная ответная реакция
2399	10	polarisation	поляризация, раскол общества
2400	10	partisan	партийно предвзятый
2401	10	bipartisan support	двухпартийная поддержка
2402	10	non-partisan	внепартийный, беспартийный
2403	10	populism	популизм
2404	10	populist leader	популистский лидер
2405	10	technocrat	технократ
2406	10	establishment	истеблишмент, правящие круги
2407	10	oppressive regime	репрессивный режим
2408	10	police state	полицейское государство
2409	10	censorship laws	законы о цензуре
2410	10	media freedom	свобода СМИ
2411	10	propaganda	пропаганда
2412	10	state-controlled media	гос‑контролируемые СМИ
2413	10	fake news	фейковые новости
2414	10	spin doctor	специалист по политическому пиару
2415	10	talking points	ключевые тезисы для выступлений
2416	10	dog-whistle politics	«шифрованные» послания для своей группы
2417	10	campaign slogan	предвыборный слоган
2418	10	manifesto	предвыборная программа, манифест
2419	10	policy proposal	политическое предложение, инициатива
2420	10	legislative agenda	законодательная повестка
2421	10	draft bill	законопроект
2422	10	to pass a bill	принять законопроект
2423	10	to veto a bill	наложить вето на закон
2424	10	veto power	право вето
2425	10	amendment	поправка к закону/конституции
2426	10	ratification	ратификация
2427	10	enforcement of a law	исполнение закона
2428	10	law enforcement agency	правоохранительный орган
2429	10	impeachment	импичмент
2430	10	to impeach a president	объявить импичмент президенту
2431	10	corruption charges	обвинения в коррупции
2432	10	conflict of interest	конфликт интересов
2433	10	abuse of power	злоупотребление властью
2434	10	violation of rights	нарушение прав
2435	10	civil liberties	гражданские свободы
2436	10	martial law	военное положение
2437	10	state of emergency	чрезвычайное положение
2438	10	sanctions	санкции
2439	10	economic sanctions	экономические санкции
2440	10	trade embargo	торговое эмбарго
2441	10	diplomatic relations	дипломатические отношения
2442	10	bilateral talks	двусторонние переговоры
2443	10	multilateral negotiations	многосторонние переговоры
2444	10	peace talks	мирные переговоры
2445	10	ceasefire agreement	соглашение о прекращении огня
2446	10	arms control	контроль над вооружениями
2447	10	nuclear disarmament	ядерное разоружение
2448	10	humanitarian aid	гуманитарная помощь
2449	10	refugee crisis	кризис беженцев
2451	10	migration policy	миграционная политика
2452	10	border security	безопасность границ
2453	10	internal affairs	внутренние дела
2454	10	foreign affairs	внешние дела
2455	10	domestic agenda	внутриполитическая повестка
2456	10	global agenda	глобальная повестка
2457	10	geopolitics	геополитика
2458	10	superpower	сверхдержава
2459	10	emerging power	восходящая держава
2460	10	international community	международное сообщество
2461	10	non-governmental organisation	негосударственная организация (NGO)
2462	10	intergovernmental organisation	межправительственная организация
2463	10	UN resolution	резолюция ООН
2464	10	binding resolution	обязательная резолюция
2465	10	non-binding resolution	рекомендательная резолюция
2466	10	transparency	прозрачность
2467	10	accountability	подотчётность
2468	10	good governance	эффективное управление
2469	10	clientelism	клиентелизм, политика «своих людей»
2470	10	patronage	патронаж, протекционизм
2471	10	vote-buying	подкуп голосов
2472	10	election fraud	фальсификация выборов
2473	10	ballot stuffing	вброс бюллетеней
2474	10	intimidation of voters	запугивание избирателей
2475	10	civil unrest	гражданские беспорядки
2476	10	mass protest	массовый протест
2477	10	riot	бунт, массовые беспорядки
2478	10	crackdown on protesters	жёсткие меры против протестующих
2479	10	public inquiry	публичное расследование
2480	10	whistleblower	информатор, разоблачитель
2481	10	political asylum	политическое убежище
2482	10	ideology	идеология
2483	10	left-wing ideology	левая идеология
2484	10	right-wing ideology	правая идеология
2485	10	centrist party	центристская партия
2486	10	liberal democracy	либеральная демократия
2487	10	social democracy	социал‑демократия
2488	10	conservatism	консерватизм
2489	10	libertarianism	либертарианство
2490	10	nationalism	национализм
2491	10	populist rhetoric	популистская риторика
2492	11	food	еда
2493	11	meal	приём пищи, блюдо
2494	11	breakfast	завтрак
2495	11	lunch	обед
2496	11	dinner	ужин
2497	11	snack	перекус
2498	11	kitchen	кухня
2499	11	cook	готовить
2500	11	chef	шеф‑повар
2501	11	recipe	рецепт
2502	11	ingredients	ингредиенты
2503	11	grocery	продукты
2504	11	supermarket	супермаркет
2505	11	shopping list	список покупок
2506	11	fridge	холодильник
2507	11	freezer	морозилка
2508	11	cupboard	кухонный шкаф
2509	11	pantry	кладовая для продуктов
2510	11	stove	плита
2511	11	oven	духовка
2512	11	microwave	микроволновка
2513	11	kettle	чайник
2514	11	frying pan	сковорода
2515	11	saucepan	кастрюля
2516	11	pot	кастрюля, горшок
2517	11	baking tray	противень
2518	11	bowl	миска
2519	11	plate	тарелка
2520	11	cup	чашка
2521	11	mug	кружка
2522	11	glass	стакан
2523	11	fork	вилка
2524	11	knife	нож
2525	11	spoon	ложка
2526	11	teaspoon	чайная ложка
2527	11	tablespoon	столовая ложка
2528	11	chopping board	разделочная доска
2529	11	kitchen knife	кухонный нож
2530	11	peeler	овощечистка
2531	11	grater	тёрка
2532	11	whisk	венчик
2533	11	ladle	половник
2534	11	spatula	лопатка
2535	11	tongs	кухонные щипцы
2536	11	colander	дуршлаг
2537	11	sieve	сито
2538	11	measuring cup	мерный стакан
2539	11	measuring spoons	мерные ложки
2540	11	to boil	варить, кипятить
2541	11	to fry	жарить
2542	11	to bake	запекать, выпекать
2543	11	to grill	готовить на гриле
2783	13	film	фильм
2544	11	to roast	запекать (мясо, овощи)
2545	11	to steam	готовить на пару
2546	11	to heat	разогревать
2547	11	to reheat	разогревать снова
2548	11	to simmer	томить на медленном огне
2549	11	to chop	рубить, резать кусочками
2550	11	to slice	резать ломтиками
2551	11	to dice	резать кубиками
2552	11	to peel	очищать от кожуры
2553	11	to grate	тереть на тёрке
2554	11	to stir	помешивать
2555	11	to mix	смешивать
2556	11	to pour	наливать
2557	11	to add	добавлять
2558	11	to taste	пробовать на вкус
2559	11	to season	приправлять
2560	11	to salt	солить
2561	11	to sweeten	подслащивать
2562	11	to marinate	мариновать
2563	11	to boil over	убегать (о кипящей воде)
2564	11	raw	сырой
2565	11	fresh	свежий
2566	11	frozen	замороженный
2567	11	cooked	приготовленный
2568	11	undercooked	недоготовленный
2569	11	overcooked	переготовленный
2570	11	burnt	подгоревший
2571	11	spicy	острый
2572	11	sweet	сладкий
2573	11	salty	солёный
2574	11	sour	кислый
2575	11	bitter	горький
2576	11	mild	неострый, мягкий вкус
2577	11	tasty	вкусный
2578	11	delicious	очень вкусный
2579	11	dish	блюдо
2580	11	main course	основное блюдо
2581	11	side dish	гарнир
2582	11	starter	закуска (первое блюдо)
2583	11	dessert	десерт
2584	11	salad	салат
2585	11	soup	суп
2586	11	sandwich	сэндвич
2587	11	burger	бургер
2588	11	pizza	пицца
2589	11	pasta	паста, макароны
2590	11	rice	рис
2591	11	noodles	лапша
2592	11	bread	хлеб
2593	11	butter	масло сливочное
2594	11	oil	масло растительное
2595	11	olive oil	оливковое масло
2596	11	sunflower oil	подсолнечное масло
2597	11	meat	мясо
2598	11	beef	говядина
2599	11	pork	свинина
2600	11	chicken	курица
2601	11	turkey	индейка
2602	11	fish	рыба
2603	11	seafood	морепродукты
2604	11	egg	яйцо
2605	11	vegetable	овощ
2606	11	fruit	фрукт
2607	11	potato	картофель
2608	11	carrot	морковь
2609	11	onion	лук
2610	11	garlic	чеснок
2611	11	tomato	помидор
2612	11	cucumber	огурец
2613	11	pepper	перец
2614	11	mushroom	гриб
2615	11	apple	яблоко
2616	11	banana	банан
2617	11	orange	апельсин
2618	11	lemon	лимон
2619	11	berries	ягоды
2620	11	salt	соль
2621	11	sugar	сахар
2622	11	flour	мука
2623	11	yeast	дрожжи
2624	11	spices	специи
2625	11	herbs	травы
2626	11	pepper (spice)	перец (специя)
2627	11	cinnamon	корица
2628	11	vanilla	ваниль
2629	11	sauce	соус
2630	11	ketchup	кетчуп
2631	11	mayonnaise	майонез
2632	11	mustard	горчица
2633	11	soy sauce	соевый соус
2634	11	cream	сливки
2635	11	cheese	сыр
2636	11	yogurt	йогурт
2637	11	milk	молоко
2638	11	dough	тесто
2639	11	pastry	выпечка, песочное тесто
2640	11	cake	торт, кекс
2641	11	cookie	печенье
2642	11	pie	пирог
2643	11	to cook at home	готовить дома
2644	11	to eat out	есть вне дома, в кафе
2645	11	takeaway food	еда навынос
2646	11	fast food	фастфуд
2647	11	homemade food	домашняя еда
2648	11	healthy food	здоровая еда
2649	11	junk food	вредная еда
2650	11	low-fat	с низким содержанием жира
2651	11	high-calorie	высококалорийный
2652	11	vegetarian	вегетарианец / вегетарианский
2653	11	vegan	веган / веганский
2654	11	allergic to	иметь аллергию на
2655	11	gluten-free	без глютена
2656	11	lactose-free	без лактозы
2657	11	to set the table	накрывать на стол
2658	11	to clear the table	убирать со стола
2659	11	leftovers	остатки еды
2660	11	to store food	хранить еду
2661	11	expiry date	срок годности
2662	11	fresh produce	свежие продукты
2663	11	frozen food	замороженная еда
2664	12	to sauté	слегка обжаривать на небольшом количестве масла
2665	12	to sear	быстро обжарить до корочки
2666	12	to caramelize	карамелизировать
2667	12	to braise	тушить (обычно мясо)
2668	12	to poach	варить на медленном огне в воде/жидкости
2669	12	to blanch	обдать кипятком, бланшировать
2670	12	to glaze	покрыть глазурью, придавать блеск
2671	12	to marinate	мариновать (в соусе/специях)
2672	12	to tenderize	размягчать мясо
2673	12	to whisk	взбивать венчиком
2674	12	to whip cream	взбивать сливки
2675	12	to knead dough	месить тесто
2676	12	to proof dough	давать тесту подойти
2677	12	to reduce a sauce	уваривать соус
2678	12	to deglaze the pan	деглазировать сковороду (добавить жидкость к поджаркам)
2679	12	to season generously	щедро приправить
2680	12	to garnish	украшать блюдо (гарниром, зеленью)
2681	12	to plate a dish	выкладывать блюдо на тарелку
2682	12	to drizzle	поливать тонкой струйкой
2683	12	to sprinkle	посыпать
2684	12	to cube	нарезать кубиками
2685	12	to julienne	нарезать тонкой соломкой
2686	12	to mince garlic	мелко порубить чеснок
2687	12	to blend until smooth	измельчать в блендере до однородности
2688	12	to emulsify	эмульгировать, смешивать несмешиваемое (масло + вода)
2689	12	to infuse	настаивать (вкус, аромат)
2690	12	to cure meat	солить, коптить, выдерживать мясо
2691	12	to smoke salmon	коптить лосося
2692	12	to ferment	бродить, ферментировать
2693	12	to pickle vegetables	мариновать овощи
2694	12	to poach an egg	готовить яйцо пашот
2695	12	to scramble eggs	делать яичницу‑болтунью
2696	12	to char	сильно обжечь, покрыть корочкой
2697	12	to scorch	слегка поджечь (иногда случайно)
2698	12	to overcook pasta	переварить пасту
2699	12	to undercook meat	недоготовить мясо
2700	12	al dente	аль денте, с лёгкой твёрдостью на зуб
2701	12	chewy	жевательный, требующий жевания
2702	12	crunchy	хрустящий
2703	12	crispy	очень хрустящий, поджаристый
2704	12	tender	мягкий, нежный (про мясо/овощи)
2705	12	juicy	сочный
2706	12	moist cake	влажный, не сухой торт
2707	12	dry chicken	сухая курица
2708	12	greasy	жирный, масляный
2709	12	oily	маслянистый
2710	12	bland	безвкусный, пресный
2711	12	flavourful	насыщенный вкусом
2712	12	savory	пикантный, несладкий
2713	12	hearty meal	сытный приём пищи
2714	12	light snack	лёгкий перекус
2715	12	rich dessert	очень калорийный, тяжёлый десерт
2716	12	indulgent treat	«греховное» угощение, удовольствие
2717	12	tangy sauce	соус с кислинкой
2718	12	zesty	яркий, с выраженной кислотой и ароматом
2719	12	spicy dish	острое блюдо
2720	12	mild curry	неострый карри
2721	12	aromatic herbs	ароматные травы
2722	12	fragrant spices	душистые специи
2723	12	smoky flavour	дымный аромат
2724	12	nutty flavour	ореховый вкус
2725	12	buttery texture	маслянистая текстура
2726	12	velvety texture	бархатистая, очень мягкая текстура
2727	12	crunchy topping	хрустящая посыпка
2728	12	flaky pastry	слоёное, рассыпчатое тесто
2729	12	home-style cooking	домашняя кухня
2730	12	comfort food	комфортная, «уютная» еда
2731	12	fine dining	высокая кухня, дорогой ресторан
2732	12	gourmet restaurant	гастрономический ресторан
2733	12	fusion cuisine	фьюжн‑кухня (смешение традиций)
2734	12	signature dish	фирменное блюдо
2735	12	house special	фирменное блюдо заведения
2736	12	slow-cooked meat	мясо, томлённое долго на медленном огне
2737	12	farm-to-table	прямо с фермы на стол (концепция свежих продуктов)
2738	12	locally sourced ingredients	местные ингредиенты
2739	12	seasonal produce	сезонные продукты
2740	12	plant-based diet	растительная диета
2741	12	whole foods	минимально обработанные продукты
2742	12	processed food	переработанная, промышленная еда
2743	12	additives	пищевые добавки
2744	12	preservatives	консерванты
2745	12	artificial flavouring	искусственный ароматизатор
2746	12	organic food	органические продукты
2747	12	sustainable farming	устойчивое земледелие
2748	12	food waste	пищевые отходы
2749	12	leftover ingredients	остатки ингредиентов
2750	12	batch cooking	готовка большими партиями
2751	12	meal prep	заготовка еды на несколько дней
2752	12	to eyeball the amount	делать «на глаз»
2753	12	to follow the recipe strictly	строго следовать рецепту
2754	12	to improvise in the kitchen	импровизировать на кухне
2755	12	to season to taste	приправить по вкусу
2756	12	to overseason a dish	переперчить/пересолить блюдо
2757	12	a balanced flavour	сбалансированный вкус
2758	12	to bring out the flavour	раскрыть вкус
2759	12	to mask the flavour	замаскировать вкус
2760	12	to pair wine with food	подбирать вино к еде
2761	12	food pairing	сочетание продуктов
2762	12	a bland, tasteless meal	пресное, безвкусное блюдо
2763	12	a mouth-watering smell	аппетитный запах, аж слюнки текут
2764	12	to make one’s mouth water	вызывать слюноотделение
2765	12	finger-licking good	«пальчики оближешь», очень вкусно
2766	12	to wolf down food	жадно есть, «уплетать»
2767	12	to nibble at something	поклёвывать, есть по чуть‑чуть
2768	12	to have a sweet tooth	любить сладкое
2769	12	to be peckish	быть слегка голодным
2770	12	ravenous hunger	волчий голод
2771	12	to spoil one’s appetite	испортить аппетит
2772	12	to skip breakfast	пропускать завтрак
2773	12	to overeat	переедать
2774	12	to cut down on sugar	сокращать сахар
2775	12	to go on a diet	садиться на диету
2776	12	to binge on junk food	обжираться вредной едой
2777	12	guilty pleasure	«виноватое» удовольствие
2778	12	a piece of cake	пара пустяков
2779	12	to spill the beans	проболтаться, раскрыть секрет
2780	12	the icing on the cake	вишенка на торте
2781	12	to bite off more than you can chew	взять на себя больше, чем можешь
2782	12	food for thought	пища для размышлений
3055	15	story	история, рассказ
3056	15	novel	роман
3057	15	comic book	комикс
3058	15	magazine	журнал
3059	15	newspaper	газета
3060	15	textbook	учебник
3061	15	notebook	тетрадь
3062	15	library	библиотека
3063	15	bookshop	книжный магазин
3064	15	bookshelf	книжная полка
3065	15	e-book	электронная книга
3066	15	audiobook	аудиокнига
3067	15	cover	обложка
3068	15	hardcover	книга в твёрдом переплёте
3069	15	paperback	мягкая обложка
3070	15	page	страница
3071	15	chapter	глава
3072	15	paragraph	абзац
3073	15	line	строка
3074	15	title	название
3075	15	subtitle	подзаголовок
3076	15	author	автор
3077	15	writer	писатель
3078	15	poet	поэт
3079	15	illustrator	иллюстратор
3080	15	character	персонаж
3081	15	main character	главный персонаж
3082	15	hero	герой
3083	15	heroine	героиня
3084	15	villain	злодей
3085	15	narrator	рассказчик
3086	15	reader	читатель
3087	15	plot	сюжет
3088	15	ending	концовка
3089	15	beginning	начало
2784	13	movie	фильм (американское)
2785	13	cinema	кинотеатр
2786	13	movie theater	кинотеатр
2787	13	screen	экран
2788	13	big screen	большой экран, кинотеатр
2789	13	TV series	сериал
2790	13	episode	эпизод, серия
2791	13	season (of a series)	сезон сериала
2792	13	trailer	трейлер
2793	13	ticket	билет
2794	13	row	ряд (в зале)
2795	13	seat	место
2796	13	audience	зрители, аудитория
2797	13	popcorn	попкорн
2798	13	snacks	закуски
2799	13	soft drink	безалкогольный напиток
2800	13	showtime	время сеанса
2801	13	to go to the cinema	пойти в кино
2802	13	to watch a movie	смотреть фильм
2803	13	to download a film	скачать фильм
2804	13	to stream a movie	смотреть фильм онлайн
2805	13	genre	жанр
2806	13	action film	боевик
2807	13	comedy	комедия
2808	13	romantic comedy	романтическая комедия
2809	13	romance film	романтический фильм
2810	13	drama	драма
2811	13	crime film	криминальный фильм
2812	13	thriller	триллер
2813	13	horror film	фильм ужасов
2814	13	science fiction film	научная фантастика
2815	13	fantasy film	фэнтези
2816	13	animated film	мультфильм
2817	13	cartoon	мультфильм (короткий, детский)
2818	13	documentary	документальный фильм
2819	13	war film	военный фильм
2820	13	historical film	исторический фильм
2821	13	musical	мюзикл
2822	13	family film	семейный фильм
2823	13	children’s film	детский фильм
2824	13	adventure film	приключенческий фильм
2825	13	fantasy series	фэнтези‑сериал
2826	13	sitcom	ситком, комедийный сериал
2827	13	reality show	реалити‑шоу
2828	13	talent show	шоу талантов
2829	13	game show	игровое шоу
2830	13	soap opera	мыльная опера
2831	13	cast	актёрский состав
2832	13	actor	актёр
2833	13	actress	актриса
2834	13	main character	главный персонаж
2835	13	supporting character	второстепенный персонаж
2836	13	extra	актер массовки
2837	13	star	звезда
2838	13	movie star	кинозвезда
2839	13	famous actor	знаменитый актёр
2840	13	director	режиссёр
2841	13	producer	продюсер
2842	13	screenwriter	сценарист
2843	13	script	сценарий
2844	13	subtitle	субтитр
2845	13	dubbed film	дублированный фильм
2846	13	original version	оригинальная версия
2847	13	with subtitles	с субтитрами
2848	13	soundtrack	саундтрек
2849	13	theme song	основная песня фильма
2850	13	special effects	спецэффекты
2851	13	scene	сцена
2852	13	opening scene	первая сцена
2853	13	final scene	последняя сцена
2854	13	plot	сюжет
2855	13	story	история
2856	13	beginning	начало
2857	13	ending	концовка
2858	13	happy ending	счастливый конец
2859	13	sad ending	грустный конец
2860	13	plot twist	неожиданный поворот сюжета
2861	13	predictable story	предсказуемый сюжет
2862	13	complicated plot	сложный сюжет
2863	13	simple plot	простой сюжет
2864	13	character	персонаж
2865	13	hero	герой
2866	13	heroine	героиня
2867	13	villain	злодей
2868	13	funny	смешной
2869	13	boring	скучный
2870	13	exciting	захватывающий
2871	13	scary	страшный
2872	13	romantic	романтичный
2873	13	emotional	эмоциональный
2874	13	violent	жестокий
2875	13	slow	медленный
2876	13	fast-paced	динамичный
2877	13	realistic	реалистичный
2878	13	unrealistic	нереалистичный
2879	13	moving film	трогательный фильм
2880	13	funny scene	смешная сцена
2881	13	boring scene	скучная сцена
3090	15	middle	середина
2882	13	to act	играть (в фильме, в театре)
2883	13	acting	актёрская игра
2884	13	good acting	хорошая игра актёров
2885	13	bad acting	плохая актёрская игра
2886	13	to play a role	играть роль
2887	13	to play the main role	играть главную роль
2888	13	to play the villain	играть злодея
2889	13	to shoot a film	снимать фильм
2890	13	to film a scene	снимать сцену
2891	13	to edit a film	монтировать фильм
2892	13	to release a film	выпустить фильм
2893	13	film premiere	премьера фильма
2894	13	box office	прокат, касса
2895	13	box office hit	кассовый хит
2896	13	box office flop	провал в прокате
2897	13	film review	рецензия на фильм
2898	13	film critic	кино‑критик
2899	13	reviewer	обозреватель
2900	13	rating	рейтинг
2901	13	high rating	высокий рейтинг
2902	13	low rating	низкий рейтинг
2903	13	to recommend a film	рекомендовать фильм
2904	13	to give a good review	дать хорошую рецензию
2905	13	to give a bad review	дать плохую рецензию
2906	13	favourite film	любимый фильм
2907	13	classic film	классический фильм
2908	13	modern film	современный фильм
2909	13	based on a true story	основан на реальных событиях
2910	13	based on a book	основан на книге
2911	13	remake	ремейк
2912	13	sequel	продолжение
2913	13	prequel	предыстория
2914	13	franchise	франшиза, серия фильмов
2915	13	Oscar	премия «Оскар»
2916	13	award-winning film	фильм, получивший награды
2917	13	animated character	анимационный персонаж
2918	13	voice acting	озвучивание
2919	13	behind the scenes	закулисье, за кадром
2920	13	film set	съёмочная площадка
2921	13	camera	камера
2922	13	director’s chair	режиссёрское кресло
2923	13	script reading	чтение сценария
2924	13	casting	кастинг
2925	13	audition	пробы, прослушивание
2926	13	to get a role	получить роль
2927	13	to reject a role	отклонить роль
2928	13	to cry in a scene	плакать в сцене
2929	13	to laugh a lot	много смеяться
2930	13	to be afraid of horror films	бояться фильмов ужасов
2931	13	to fall asleep during the film	заснуть во время фильма
2932	13	to watch films with friends	смотреть фильмы с друзьями
2933	14	performance	исполнение роли, актёрская игра
2934	14	outstanding performance	выдающаяся игра
2935	14	subtle acting	тонкая актёрская игра
2936	14	overacting	переигрывание
2937	14	natural performance	естественная игра
2938	14	believable character	правдоподобный персонаж
2939	14	character development	развитие персонажа
2940	14	character arc	арка персонажа, его путь
2941	14	on-screen chemistry	химия между героями на экране
2942	14	supporting role	второстепенная роль
2943	14	leading role	главная роль
2944	14	ensemble cast	ансамблевый актёрский состав
2945	14	typecasting	амплуа, закрепление за одним типажом
2946	14	method acting	метод‑актёрство, «жить» ролью
2947	14	improvisation	импровизация
2948	14	casting director	директор по кастингу
2949	14	screen presence	харизма на экране
2950	14	monologue	монолог
2951	14	dialogue	диалог
2952	14	voice-over	закадровый голос
2953	14	narration	закадровый рассказ
2954	14	cinematography	кинематография, операторская работа
2955	14	camera movement	движение камеры
2956	14	close-up shot	крупный план
2957	14	wide shot	общий план
2958	14	tracking shot	наезд/движущийся кадр
2959	14	handheld camera	ручная камера (эффект тряски)
2960	14	framing	композиция кадра
2961	14	lighting	освещение
2962	14	sound design	звуковое оформление
2963	14	visual effects	визуальные эффекты (VFX)
2964	14	practical effects	натурные спецэффекты
2965	14	make-up artist	гримёр
2966	14	costume designer	художник по костюмам
2967	14	production designer	художник‑постановщик
2968	14	set designer	дизайнер декораций
2969	14	location shooting	съёмки на натуре
2970	14	soundtrack composer	композитор саундтрека
2971	14	haunting soundtrack	запоминающийся, «преследующий» саундтрек
2972	14	screenplay	сценарий (как литературное произведение)
2973	14	screenplay adaptation	экранизация сценария/книги
2974	14	tight script	хорошо выстроенный сценарий
2975	14	weak script	слабый сценарий
2976	14	plot hole	сюжетная дыра
2977	14	logical inconsistency	логическое несоответствие
2978	14	pacing	темп повествования
2979	14	slow-paced film	фильм с медленным темпом
2980	14	fast-paced thriller	динамичный триллер
2981	14	character-driven story	сюжет, основанный на персонажах
2982	14	plot-driven film	сюжетно‑ориентированный фильм
2983	14	climax	кульминация
2984	14	resolution	развязка
2985	14	backstory	предыстория персонажа
2986	14	flashback	флэшбек
2987	14	foreshadowing	предвосхищение, намёк на будущее
2988	14	voice acting	озвучка, актёрская игра голосом
2989	14	cinematic universe	киновселенная
2990	14	spin-off	ответвление, отдельная история персонажа
2991	14	reboot	перезапуск франшизы
2992	14	limited series	ограниченный сериал
2993	14	miniseries	мини‑сериал
2994	14	anthology series	антологический сериал
2995	14	binge-watch	смотреть запоем
2996	14	cliffhanger	обрыв на самом интересном месте
2997	14	pilot episode	пилотный эпизод
2998	14	season finale	финал сезона
2999	14	spoiler	спойлер
3000	14	spoiler-free review	обзор без спойлеров
3001	14	cameo appearance	камео, короткое появление знаменитости
3002	14	cult classic	культовая классика
3003	14	blockbuster	блокбастер
3004	14	indie film	независимое кино
3005	14	arthouse cinema	артхаусное кино
3006	14	low-budget film	малобюджетный фильм
3007	14	big-budget production	крупнобюджетная постановка
3008	14	mainstream audience	массовый зритель
3009	14	niche audience	узкая аудитория
3010	14	box-office success	успех в прокате
3011	14	box-office failure	провал в прокате
3012	14	critically acclaimed	высоко оценён критиками
3013	14	overrated film	переоценённый фильм
3014	14	underrated gem	недооценённая жемчужина
3015	14	Oscar-nominated	номинированный на Оскар
3016	14	award-winning actor	актер, получивший награды
3017	14	film festival	кинофестиваль
3018	14	red carpet event	красная дорожка
3019	14	press junket	серия интервью для прессы
3020	14	film critic	кино‑критик
3021	14	review aggregator	агрегатор рецензий
3022	14	audience score	оценка зрителей
3023	14	critic score	оценка критиков
3024	14	character-driven performance	игра, основанная на глубоком персонаже
3025	14	emotional range	эмоциональный диапазон
3026	14	wooden acting	деревянная, невыразительная игра
3027	14	scene-stealing actor	актёр, перетягивающий внимание в сценах
3028	14	understated acting	сдержанная, ненавязчивая игра
3029	14	over-the-top performance	слишком преувеличенная игра
3030	14	to identify with a character	отождествлять себя с персонажем
3031	14	relatable hero	герой, близкий по ощущениям зрителю
3032	14	two-dimensional character	плоский, неглубокий персонаж
3033	14	multi-layered character	многослойный, сложный персонаж
3034	14	strong female lead	сильная главная героиня
3035	14	ensemble performance	ансамблевая актёрская игра
3036	14	dialogue-driven scene	сцена, построенная на диалоге
3037	14	visually stunning	визуально впечатляющий
3038	14	thought-provoking film	фильм, заставляющий задуматься
3039	14	light-hearted comedy	лёгкая, беззаботная комедия
3040	14	dark comedy	чёрная комедия
3041	14	character study	портрет персонажа, «исследование характера»
3042	14	social commentary	социальный комментарий
3043	14	twist ending	неожиданная развязка
3044	14	open ending	открытая концовка
3045	14	cameo by the director	камео режиссёра
3046	14	post-credits scene	сцена после титров
3047	14	to suspend disbelief	приостанавливать недоверие
3048	14	to break the fourth wall	ломать четвёртую стену
3049	14	voice acting in animation	актёрская озвучка в анимации
3050	14	motion capture	захват движений
3051	14	character-driven plot	сюжет, движимый персонажами
3052	14	story arc	сюжетная дуга
3053	14	visual storytelling	визуальный рассказ, история картинкой
3091	15	setting	место и время действия
3092	15	dialogue	диалог
3093	15	description	описание
3094	15	illustration	иллюстрация
3095	15	blurb	аннотация на обложке
3096	15	preface	предисловие
3097	15	contents page	страница с оглавлением
3098	15	index	алфавитный указатель
3099	15	fiction	художественная литература
3100	15	non-fiction	нехудожественная литература
3101	15	poetry	поэзия
3102	15	short story	короткий рассказ
3103	15	fairy tale	сказка
3104	15	detective story	детектив
3105	15	fantasy book	фэнтези‑книга
3106	15	science fiction book	научно‑фантастическая книга
3107	15	romantic novel	любовный роман
3108	15	historical novel	исторический роман
3109	15	biography	биография
3110	15	autobiography	автобиография
3111	15	self-help book	книга по саморазвитию
3112	15	cookbook	кулинарная книга
3113	15	children’s book	детская книга
3114	15	young adult novel	подростковый роман
3115	15	crime novel	криминальный роман
3116	15	thriller	триллер (книга)
3117	15	horror story	история ужасов
3118	15	classic literature	классическая литература
3119	15	bestseller	бестселлер
3120	15	series	книжная серия
3121	15	volume	том
3122	15	to read	читать
3123	15	to read aloud	читать вслух
3124	15	to read silently	читать про себя
3125	15	to start a book	начать книгу
3126	15	to finish a book	закончить книгу
3127	15	to put a book down	отложить книгу
3128	15	to pick a book up	взять книгу
3129	15	to borrow a book	взять книгу напрокат
3130	15	to lend a book	одолжить книгу
3131	15	to return a book	вернуть книгу
3132	15	to renew a book	продлить срок книги в библиотеке
3133	15	to turn the page	перевернуть страницу
3134	15	to skip a page	пропустить страницу
3135	15	to underline	подчёркивать
3136	15	to highlight	выделять маркером
3137	15	bookmark	закладка
3138	15	to use a bookmark	использовать закладку
3139	15	to get lost in a book	«потеряться» в книге
3140	15	to enjoy reading	получать удовольствие от чтения
3141	15	to hate reading	не любить чтение
3142	15	book lover	любитель книг
3143	15	avid reader	заядлый читатель
3144	15	light reading	лёгкое чтение
3145	15	required reading	обязательное чтение
3146	15	recommended reading	рекомендуемое чтение
3147	15	to study from a book	заниматься по книге
3148	15	to look up a word	искать слово в книге/словаре
3149	15	interesting book	интересная книга
3150	15	boring book	скучная книга
3151	15	funny story	смешная история
3152	15	sad story	грустная история
3153	15	inspiring book	вдохновляющая книга
3154	15	easy to read	легко читать
3155	15	hard to read	трудно читать
3156	15	simple language	простой язык
3157	15	complex language	сложный язык
3158	15	book review	книжная рецензия
3159	15	to write a review	писать рецензию
3160	15	book rating	оценка книги
3161	15	favourite author	любимый автор
3162	15	favourite book	любимая книга
3163	15	to recommend a book	рекомендовать книгу
3164	15	to lend books to friends	давать книги друзьям
3165	15	to read before bed	читать перед сном
3166	15	to read on the bus	читать в автобусе
3167	15	to read on an e-reader	читать на ридере
3168	15	to listen to audiobooks	слушать аудиокниги
3169	15	quiet reading time	тихое время для чтения
3170	15	reading habit	привычка читать
3171	15	book club	книжный клуб
3172	15	library card	читательский билет
3173	15	due date	дата возврата книги
3174	15	overdue book	просроченная книга
3175	15	to pay a fine	заплатить штраф (в библиотеке)
3176	16	literary fiction	интеллектуальная художественная проза
3177	16	genre fiction	жанровая литература
3178	16	narrative	повествование
3179	16	narrative voice	повествовательный голос
3180	16	first-person narrator	рассказчик от первого лица
3181	16	third-person narrator	рассказчик от третьего лица
3182	16	omniscient narrator	всезнающий рассказчик
3183	16	unreliable narrator	ненадёжный рассказчик
3184	16	protagonist	главный герой, протагонист
3185	16	antagonist	противник героя, антагонист
3186	16	supporting character	второстепенный персонаж
3187	16	flat character	плоский, неразвитый персонаж
3188	16	round character	объёмный, «живой» персонаж
3189	16	character arc	персонажная арка, развитие героя
3190	16	coming-of-age novel	роман взросления
3191	16	bildungsroman	роман становления личности
3192	16	plot-driven story	сюжет‑ориентированная история
3193	16	character-driven story	история, основанная на героях
3194	16	subplot	второстепенная сюжетная линия
3195	16	backstory	предыстория
3196	16	exposition	экспозиция, вводная часть
3197	16	rising action	нарастающее действие
3198	16	climax	кульминация
3199	16	falling action	спад действия после кульминации
3200	16	resolution	развязка
3201	16	twist ending	неожиданная развязка
3202	16	open ending	открытый финал
3203	16	foreshadowing	предвосхищение, намёк на будущие события
3204	16	flashback	флэшбек, сцена из прошлого
3205	16	flashforward	перенос действия в будущее
3206	16	symbolism	символизм
3207	16	motif	повторяющийся мотив
3208	16	theme	основная тема
3209	16	central message	главная мысль произведения
3210	16	tone	тон, отношение автора
3211	16	mood	настроение текста
3212	16	style	литературный стиль
3213	16	narrative style	манера повествования
3214	16	figurative language	образный язык
3215	16	metaphor	метафора
3216	16	simile	сравнение (как, словно)
3217	16	personification	олицетворение
3218	16	hyperbole	гипербола, преувеличение
3219	16	understatement	преуменьшение
3220	16	irony	ирония
3221	16	sarcasm	сарказм
3222	16	satire	сатира
3223	16	allegory	аллегория
3224	16	parable	притча
3225	16	fable	басня
3226	16	cliché	клише, избитое выражение
3227	16	trope	художественный приём, троп
3228	16	imagery	образность, система образов
3229	16	vivid imagery	яркие образы
3230	16	stream of consciousness	поток сознания
3231	16	free indirect speech	свободная косвенная речь
3232	16	dialogue-driven	основанный на диалоге
3233	16	descriptive passage	описательный отрывок
3234	16	poetic prose	поэтичная проза
3235	16	minimalist style	минималистичный стиль
3236	16	dense prose	насыщенная, «тяжёлая» проза
3237	16	accessible language	доступный язык
3238	16	complex syntax	сложный синтаксис
3239	16	archaic language	устаревший язык
3240	16	colloquial language	разговорный язык
3241	16	narrative pace	темп повествования
3242	16	slow-paced novel	неторопливый роман
3243	16	fast-paced thriller	динамичный триллер
3244	16	page-turner	«проглатываемая» книга
3245	16	hard to get into	сложно «войти» в книгу
3246	16	thought-provoking	заставляющий задуматься
3247	16	heart-wrenching	душераздирающий
3248	16	uplifting	поднимающий настроение, воодушевляющий
3249	16	gripping	захватывающий
3250	16	unputdownable	невозможно оторваться
3251	16	overrated novel	переоценённый роман
3252	16	underrated author	недооценённый автор
3253	16	literary classic	литературная классика
3254	16	modern classic	современная классика
3255	16	contemporary fiction	современная проза
3256	16	historical fiction	историческая проза
3257	16	dystopian novel	антиутопический роман
3258	16	post-apocalyptic fiction	постапокалиптическая проза
3259	16	magic realism	магический реализм
3260	16	epic fantasy	эпическое фэнтези
3261	16	hard science fiction	жёсткая научная фантастика
3262	16	literary criticism	литературная критика
3263	16	critical analysis	критический анализ
3264	16	close reading	внимательное чтение, анализ текста
3265	16	interpretation	толкование
3266	16	to analyse a text	анализировать текст
3267	16	to quote a passage	цитировать отрывок
3268	16	to identify themes	выделять темы
3269	16	to explore symbolism	исследовать символизм
3270	16	to discuss character motivation	обсуждать мотивацию персонажей
3271	16	plot summary	краткое изложение сюжета
3272	16	spoiler-free summary	краткий пересказ без спойлеров
3273	16	book review	рецензия на книгу (расширенный формат)
3274	16	literary device	художественный приём
3275	16	cliffhanger ending	финал на самом напряжённом месте
3276	16	frame narrative	рамочное повествование
3277	16	multiple perspectives	несколько точек зрения
3278	16	dual timeline	две временные линии
3279	16	epilogue	эпилог
3280	16	prologue	пролог
3281	16	foreword	предисловие (обычно не автора)
3282	16	acknowledgements	благодарности в конце книги
3283	16	glossary	глоссарий, список терминов с объяснениями
3284	16	bibliography	список литературы
3285	16	footnote	сноска
3286	16	endnote	концевая сноска
3287	16	annotated edition	издание с комментариями
3288	16	abridged version	сокращённая версия
3289	16	unabridged edition	полное, несокращённое издание
3290	16	hard-hitting novel	жёсткий, «ударяющий» роман
3291	16	social commentary	социальный комментарий в литературе
3292	17	technology	технологии
3293	17	device	устройство
3294	17	gadget	гаджет
3295	17	computer	компьютер
3296	17	laptop	ноутбук
3297	17	tablet	планшет
3298	17	smartphone	смартфон
3299	17	desktop computer	стационарный компьютер
3300	17	keyboard	клавиатура
3301	17	mouse	компьютерная мышь
3302	17	screen	экран
3303	17	monitor	монитор
3304	17	headphones	наушники
3305	17	earphones	вкладыши, маленькие наушники
3306	17	charger	зарядное устройство
3307	17	cable	кабель
3308	17	USB cable	USB‑кабель
3309	17	power button	кнопка включения
3310	17	battery	батарея
3311	17	low battery	низкий заряд
3312	17	to charge a phone	заряжать телефон
3313	17	to plug in	подключать к розетке
3314	17	to unplug	выключить из розетки
3315	17	Wi‑Fi	вай‑фай
3316	17	Internet	интернет
3317	17	router	роутер
3318	17	modem	модем
3319	17	network	сеть
3320	17	to connect to Wi‑Fi	подключиться к вай‑фаю
3321	17	to go online	выйти в интернет
3322	17	to go offline	отключиться от сети
3323	17	website	веб‑сайт
3324	17	web page	веб‑страница
3325	17	link	ссылка
3326	17	browser	браузер
3327	17	search engine	поисковая система
3328	17	to search for information	искать информацию
3329	17	to click on a link	нажать на ссылку
3330	17	to scroll	скроллить, прокручивать
3331	17	to download	скачивать
3332	17	to upload	загружать
3333	17	file	файл
3334	17	folder	папка
3335	17	document	документ
3336	17	photo	фото
3337	17	video	видео
3338	17	music file	музыкальный файл
3339	17	to save a file	сохранить файл
3340	17	to open a file	открыть файл
3341	17	to delete a file	удалить файл
3342	17	to copy and paste	копировать и вставить
3343	17	to attach a file	прикрепить файл
3344	17	app	приложение
3345	17	application	приложение (полное слово)
3346	17	mobile app	мобильное приложение
3347	17	to install an app	установить приложение
3348	17	to uninstall an app	удалить приложение
3349	17	update	обновление
3350	17	software update	обновление ПО
3351	17	software	программное обеспечение
3352	17	hardware	«железо», физические компоненты
3353	17	operating system	операционная система
3354	17	Windows	Windows
3355	17	macOS	macOS
3356	17	Android	Android
3357	17	iOS	iOS
3358	17	to log in	войти в систему
3359	17	to log out	выйти из системы
3360	17	username	имя пользователя
3361	17	password	пароль
3362	17	strong password	надёжный пароль
3363	17	weak password	слабый пароль
3364	17	to sign up	зарегистрироваться
3365	17	to sign in	войти в аккаунт
3366	17	account	аккаунт
3367	17	profile	профиль
3368	17	settings	настройки
3369	17	notification	уведомление
3370	17	to turn on notifications	включить уведомления
3371	17	to turn off notifications	выключить уведомления
3372	17	social media	социальные сети
3373	17	social network	соцсеть
3374	17	to post a photo	выкладывать фото
3375	17	to like a photo	ставить лайк фото
3376	17	to comment	комментировать
3377	17	to share a link	поделиться ссылкой
3378	17	chat	чат
3379	17	message	сообщение
3380	17	to send a message	послать сообщение
3381	17	to reply	ответить
3382	17	email	электронная почта
3383	17	email address	адрес электронной почты
3384	17	inbox	входящие
3385	17	spam	спам
3386	17	video call	видеозвонок
3387	17	to make a video call	совершить видеозвонок
3388	17	headset	гарнитура
3389	17	microphone	микрофон
3390	17	webcam	веб‑камера
3391	17	online meeting	онлайн‑встреча
3392	17	screen sharing	демонстрация экрана
3393	17	cloud storage	облачное хранилище
3394	17	backup	резервная копия
3395	17	to back up files	делать резервную копию файлов
3396	17	to lose data	потерять данные
3397	17	data	данные
3398	17	database	база данных
3399	17	to print a document	распечатать документ
3400	17	printer	принтер
3401	17	scanner	сканер
3402	17	smart TV	смарт‑телевизор
3403	17	smartwatch	умные часы
3404	17	smart home	умный дом
3405	17	voice assistant	голосовой помощник
3406	17	virtual reality	виртуальная реальность
3407	17	VR headset	очки виртуальной реальности
3408	17	augmented reality	дополненная реальность
3409	17	gaming console	игровая приставка
3410	17	controller	геймпад, контроллер
3411	17	online game	онлайн‑игра
3412	17	lag	лаг, задержка
3413	17	to freeze	зависать, «фризиться»
3414	17	to crash	крашиться, вылетать
3415	17	bug	ошибка, баг
3416	17	to fix a bug	исправить баг
3417	17	to restart the device	перезагрузить устройство
3418	17	to update the app	обновить приложение
3419	17	to reset settings	сбросить настройки
3420	17	virus	компьютерный вирус
3421	17	antivirus program	антивирус
3422	17	malware	вредоносное ПО
3423	17	to protect your data	защищать свои данные
3424	17	privacy	конфиденциальность
3425	17	online safety	безопасность в сети
3426	17	screen time	время за экраном
3427	17	to reduce screen time	уменьшить время за экраном
3428	17	to be addicted to the phone	быть зависимым от телефона
3429	18	cutting-edge technology	передовые, ультрасовременные технологии
3430	18	emerging technology	зарождающаяся, новая технология
3431	18	digital transformation	цифровая трансформация
3432	18	disruptive innovation	прорывная инновация, ломающая рынок
3433	18	automation	автоматизация
3434	18	artificial intelligence	искусственный интеллект
3435	18	machine learning	машинное обучение
3436	18	neural network	нейронная сеть
3437	18	algorithm	алгоритм
3438	18	data-driven decision	решение на основе данных
3439	18	big data	большие данные
3440	18	data analysis	анализ данных
3441	18	cloud computing	облачные вычисления
3442	18	cloud-based service	облачный сервис
3443	18	server infrastructure	серверная инфраструктура
3444	18	scalability	масштабируемость
3445	18	high-performance server	высокопроизводительный сервер
3446	18	uptime	время безотказной работы
3447	18	downtime	время простоя
3448	18	cybersecurity	кибербезопасность
3449	18	data breach	утечка данных
3450	18	data encryption	шифрование данных
3451	18	firewall	межсетевой экран
3452	18	two-factor authentication	двухфакторная аутентификация
3453	18	password manager	менеджер паролей
3454	18	phishing attack	фишинговая атака
3455	18	ransomware	вымогательское ПО
3456	18	malicious software	вредоносное ПО
3457	18	identity theft	кража личности
3458	18	privacy settings	настройки конфиденциальности
3459	18	digital footprint	цифровой след
3460	18	online reputation	репутация в сети
3461	18	user interface	пользовательский интерфейс
3462	18	user experience	пользовательский опыт (UX)
3463	18	intuitive design	интуитивно понятный дизайн
3464	18	responsive design	адаптивный дизайн
3465	18	mobile-friendly website	сайт, удобный для мобильных устройств
3466	18	cross-platform app	кроссплатформенное приложение
3467	18	open-source software	программное обеспечение с открытым исходным кодом
3468	18	proprietary software	проприетарное программное обеспечение
3469	18	software developer	разработчик ПО
3470	18	software engineer	инженер‑программист
3471	18	front-end developer	фронтенд‑разработчик
3472	18	back-end developer	бэкенд‑разработчик
3473	18	full-stack developer	фулстек‑разработчик
3474	18	QA engineer	инженер по качеству (QA)
3475	18	IT support specialist	специалист технической поддержки
3476	18	network administrator	сетевой администратор
3477	18	system administrator	системный администратор
3478	18	IT infrastructure	IT‑инфраструктура
3479	18	tech-savvy	технически подкованный
3480	18	early adopter	ранний пользователь новых технологий
3481	18	user-friendly	удобный для пользователя
3482	18	feature-rich	функционально насыщенный
3483	18	buggy software	глючное ПО, с багами
3484	18	to release a new version	выпустить новую версию
3485	18	software update	обновление программного обеспечения
3486	18	security patch	патч безопасности
3487	18	beta version	бета‑версия
3488	18	stable release	стабильный релиз
3489	18	to roll out an update	развернуть обновление
3490	18	to troubleshoot an issue	устранять проблему
3491	18	system crash	сбой системы
3492	18	hardware failure	отказ оборудования
3493	18	backup solution	решение для резервного копирования
3494	18	disaster recovery plan	план восстановления после аварии
3495	18	remote work tools	инструменты для удалённой работы
3496	18	video conferencing platform	платформа для видеоконференций
3497	18	collaboration software	софт для совместной работы
3498	18	productivity app	приложение для продуктивности
6775	25	draught	сквозняк
3499	18	notification overload	перегруз уведомлениями
3500	18	digital detox	цифровой детокс
3501	18	screen addiction	зависимость от экрана
3502	18	social media platform	платформа социальных сетей
3503	18	content creator	создатель контента
3504	18	influencer	инфлюенсер
3505	18	online community	онлайн‑сообщество
3506	18	streaming service	стриминговый сервис
3507	18	on-demand content	контент по запросу
3508	18	binge-watching	смотрение сериалов запоем
3509	18	digital subscription	цифровая подписка
3510	18	paywall	платный доступ (пейволл)
3511	18	e-commerce platform	платформа электронной коммерции
3512	18	online payment system	онлайн платёжная система
3513	18	contactless payment	бесконтактная оплата
3514	18	cryptocurrency	криптовалюта
3515	18	blockchain technology	технология блокчейн
3516	18	smart contract	смарт‑контракт
3517	18	fintech startup	финтех‑стартап
3518	18	Internet of Things	интернет вещей (IoT)
3519	18	smart device	умное устройство
3520	18	home automation	автоматизация дома
3521	18	wearable technology	носимая электроника
3522	18	fitness tracker	фитнес‑браслет
3523	18	augmented reality app	приложение дополненной реальности
3524	18	virtual reality experience	опыт виртуальной реальности
3525	18	3D printing	3D‑печать
3526	18	biometric data	биометрические данные
3527	18	face recognition	распознавание лица
3528	18	voice recognition	распознавание голоса
3529	18	digital divide	цифровое неравенство
3530	18	technology gap	технологический разрыв
3531	18	access to technology	доступ к технологиям
3532	18	online education platform	платформа онлайн‑образования
3533	18	distance learning	дистанционное обучение
3534	18	e-learning course	онлайн‑курс
3535	18	plagiarism detector	система проверки на плагиат
3536	18	screen recording	запись экрана
3537	18	data privacy law	закон о защите данных
3538	18	terms of service	условия использования
3539	18	user agreement	пользовательское соглашение
3540	18	to go viral	стать вирусным (о контенте)
3541	18	to upload content	загружать контент
3542	18	to moderate comments	модерировать комментарии
3543	18	to report abuse	пожаловаться на злоупотребление
3544	18	online harassment	онлайн‑домогательства
3545	18	cyberbullying	кибербуллинг
3546	18	digital nomad	цифровой кочевник
3547	18	remote-first company	компания с приоритетом удалённой работы
3548	18	tech startup	тех‑стартап
3549	18	startup ecosystem	экосистема стартапов
3550	18	venture capital	венчурный капитал
3551	18	scalable business model	масштабируемая бизнес‑модель
3552	18	prototype	прототип
3553	18	minimum viable product	минимально жизнеспособный продукт (MVP)
3554	18	beta tester	бета‑тестер
3555	18	feedback loop	цикл обратной связи
3556	18	roadmap	дорожная карта (план развития продукта)
6776	25	heading	заглавие
6777	25	chamber	камера
6778	25	doorway	дверной проем
6779	25	cop	полицейский
6780	25	beast	зверь
6781	25	palm	ладонь
6782	25	tank	бак
6783	25	fleet	флот
6784	25	rod	стержень
6785	25	grace	грация
6786	25	rank	ранг
6787	25	barrel	бочка
6788	25	panel	панель
6789	25	lad	парень
6790	25	footstep	шаг
6791	25	notion	понятие
6792	25	avenue	проспект
6793	25	aid	помощь
6794	25	gravity	гравитация
6795	25	wit	остроумие
6796	25	pad	подкладка
6797	25	saint	святой
6798	25	instance	пример
6799	25	deputy	заместитель
6800	25	merchant	торговец
6801	25	suite	номер люкс
6802	25	vessel	судно
6803	25	lawn	газон
6804	25	buddy	приятель
6805	25	pulse	пульс
6806	25	patrol	патруль
6807	25	triumph	триумф
6808	25	spine	позвоночник
6809	25	senator	сенатор
6810	25	butt	задница
6811	25	bubble	пузырь
6812	25	personnel	персонал
6813	25	glory	слава
6814	25	focus	фокус
6815	25	sin	грех
6816	25	realm	область
6817	25	impulse	импульс
6818	25	print	отпечаток
6819	25	chunk	ломоть
6820	25	staircase	лестница
6821	25	status	статус
6822	25	trader	трейдер
6823	25	dock	док
6824	25	coal	уголь
6825	25	campaign	кампания
6826	25	stake	доля
6827	25	burden	бремя
6828	25	limb	конечность
6829	25	fabric	ткань
6830	25	radar	радар
6831	25	technician	техник
6832	25	canvas	холст
6833	25	hesitation	нерешительность
6834	25	genius	гений
6835	25	humanity	человечество
6836	25	garment	одежда
6837	25	bulk	масса
6838	25	logic	логика
6839	25	principle	принцип
6840	25	republic	республика
6841	25	vein	вена
6842	25	fund	фонд
6843	25	cluster	скопление
6844	25	settlement	поселение
6845	25	feast	застолье
6846	25	log	бревно
6847	25	pony	пони
6848	25	banner	знамя
6849	25	foundation	основа
6850	25	machinery	механизм
6851	25	mechanism	механизм
6852	25	destiny	судьба
6853	25	blast	взрыв
6854	25	awareness	осведомленность
6855	25	debris	обломки
6856	25	deed	деяние
6857	25	outsider	аутсайдер
6858	25	surveillance	наблюдение
6859	25	trailer	прицеп
6860	25	gene	ген
6861	25	vine	лоза
6862	25	caution	осторожность
6863	25	surgeon	хирург
6864	25	organ	орган
6865	25	tactic	тактика
6866	25	scholar	ученый
6867	25	warrant	ордер
6868	25	knob	ручка
6869	25	vest	жилет
6870	25	inspection	осмотр
6871	25	physician	врач
6872	25	necessity	необходимость
6873	25	loop	петля
6874	25	battlefield	поле боя
6875	25	mill	мельница
6876	25	aide	помощник
6877	25	indication	признак
6878	25	carriage	вагон
6879	25	slot	шлиц
6880	25	acquaintance	знакомство
6881	25	implication	причастность
6882	25	journal	журнал
6883	25	riot	массовые беспорядки
6884	25	youngster	юноша
6885	25	asset	имущество
6886	25	angle	угол
6887	25	privilege	привилегия
6888	25	hatred	ненависть
6889	25	distress	горе
6890	25	shuttle	челнок
6891	25	warrior	воин
6892	25	thrill	трепет
6893	25	sphere	сфера
6894	25	ash	пепел
6895	25	bronze	бронза
6896	25	radiation	излучение
6897	25	sacrifice	жертва
6898	25	bishop	епископ
6899	25	emperor	император
6900	25	mansion	особняк
6901	25	trigger	триггер
6902	25	warehouse	склад
6903	25	brass	латунь
6904	25	rifle	винтовка
6905	25	witch	ведьма
6906	25	straw	солома
6907	25	peasant	крестьянин
6908	25	veil	вуаль
6909	25	well	колодец
6910	25	crown	корона
6911	25	demon	демон
6912	25	monk	монах
6913	25	self	личность
6914	25	hate	ненависть
6915	25	hunt	охота
6916	25	ally	союзник
6917	25	glimpse	проблеск
6918	25	twist	твист
6919	25	halt	остановка
6920	25	lounge	гостиная
6921	25	embrace	объятия
6922	25	grin	широкая улыбка
6923	25	praise	похвала
6924	25	superior	начальник
6925	25	much	многое
6926	25	say	слово
6927	25	military	военнослужащие
6928	25	exhaust	выхлоп
6929	25	shoot	побег
6930	25	rear	тыл
6931	25	spell	заклинание
6932	25	realisation	осознание
6933	25	grid	сетка
6934	25	precaution	предосторожность
6935	25	blind	жалюзи
6936	25	assumption	предположение
6937	25	speculation	предположение
6938	25	spectacle	спектакль
6939	25	annoyance	раздражение
6940	25	joint	сустав
6941	25	innocence	невинность
6942	25	academy	академия
6943	25	appetite	аппетит
6944	25	stem	стебель
6945	25	array	множество
6946	25	index	индекс
6947	25	descent	спуск
6948	25	terrain	местность
6949	25	pyramid	пирамида
6950	25	thread	нить
6951	25	manuscript	рукопись
6952	25	distraction	отвлекающий фактор
6953	25	permit	разрешение
6954	25	mat	коврик
6955	25	fluid	жидкость
6956	25	capability	способность
6957	25	predator	хищник
6958	25	nap	дремота
6959	25	cargo	груз
6960	25	perspective	перспектива
6961	25	mode	режим
6962	25	rebellion	восстание
6963	25	anchor	якорь
6964	25	accusation	обвинение
6965	25	fright	испуг
6966	25	domain	область
6967	25	posture	осанка
6968	25	sector	сектор
6969	25	cocktail	коктейль
6970	25	vegetation	растительность
6971	25	tobacco	табак
6972	25	engagement	помолвка
6973	25	applause	аплодисменты
6974	25	execution	исполнение
6975	25	junk	хлам
6976	25	vacuum	вакуум
6977	25	testimony	свидетельское показание
6978	25	enterprise	предприятие
6979	25	rival	соперник
6980	25	leadership	руководство
6981	25	phenomenon	явление
6982	25	outcome	результат
6983	25	torture	пытка
6984	25	midst	середина
6985	25	boundary	граница
6986	25	administration	администрация
6987	25	sketch	эскиз
6988	25	restraint	сдержанность
6989	25	discomfort	дискомфорт
6990	25	opposition	противодействие
6991	25	coordinate	координата
6992	25	blessing	счастье
6993	25	significance	значимость
6994	25	scope	масштаб
6995	25	beak	клюв
6996	25	uncertainty	неопределенность
6997	25	warfare	война
6998	25	fibre	волокно
6999	25	jealousy	ревность
7000	25	succession	преемственность
7001	25	mine	рудник
7002	25	executive	исполнительная власть
7003	25	mainland	материк
7004	25	paradise	рай
7005	25	miner	шахтер
7006	25	convention	условность
7007	25	flaw	изъян
7008	25	dam	плотина
7009	25	assurance	уверенность
7010	25	component	компонент
7011	25	token	знак
7012	25	proportion	доля
7013	25	fascination	очарование
7014	25	acre	акр
7015	25	patron	покровитель
7016	25	establishment	учреждение
7017	25	hazard	опасность
7018	25	essence	суть
7019	25	clarity	ясность
7020	25	complex	комплекс
7021	25	probability	вероятность
7022	25	archive	архив
7023	25	assassination	убийство
7024	25	hospitality	гостеприимство
7025	25	rental	арендная плата
7026	25	charter	устав
7027	25	bass	бас
7028	25	gathering	сборище
7029	25	projection	проекция
7030	25	reminder	напоминание
7031	25	acceptance	принятие
7032	25	bow	поклон
7033	25	protocol	протокол
7034	25	probe	зонд
7035	25	screw	винт
7036	25	surge	резкое увеличение
7037	25	runway	дорожка
7038	25	summit	высший уровень
7039	25	exterior	экстерьер
7040	25	exile	изгнание
7041	25	commissioner	комиссар
7042	25	obstacle	препятствие
7043	25	fuss	суета
7044	25	apparatus	аппаратура
7045	25	proceeding	разбирательство
7046	25	ministry	министерство
7047	25	adaptation	адаптация
7048	25	compassion	сострадание
7049	25	tendency	тенденция
7050	25	amateur	любитель
7051	25	precision	точность
7052	25	breach	нарушение
7053	25	loneliness	одиночество
7054	25	dispute	спор
7055	25	ego	эго
7056	25	interference	вмешательство
7057	25	chore	рутинная работа
7058	25	habitat	среда обитания
7059	25	formula	формула
7060	25	saying	поговорка
7061	25	arena	арена
7062	25	gadget	гаджет
7063	25	disturbance	нарушение
7064	25	consent	согласие
7065	25	perfection	совершенство
7066	25	stretch	протяжение
7067	25	greed	жадность
7068	25	faction	фракция
7069	25	dump	свалка
7070	25	boom	гул
7071	25	councillor	член городского или местного совета
7072	25	exposure	экспозиция
7073	25	equation	уравнение
7074	25	proposition	предложение
7075	25	utility	утилита
7076	25	excess	избыток
7077	25	collision	столкновение
7078	25	mining	добыча
7079	25	dime	монета в 10 центов
7080	25	isolation	изоляция
7081	25	toll	пошлина
7082	25	cult	культ
7083	25	compass	компас
7084	25	merit	заслуга
7085	25	casino	казино
7086	25	successor	преемник
7087	25	supervisor	руководитель
7088	25	remainder	остаток
7089	25	fit	приступ
7090	25	listener	слушатель
7091	25	hydrogen	водород
7092	25	historian	историк
7093	25	stocking	чулок
7094	25	auto	автомобиль
7095	25	niche	ниша
7096	25	bribe	взятка
7097	25	archaeologist	археолог
7098	25	installation	установка
7099	25	enforcement	принуждение
7100	25	insight	понимание
7101	25	misfortune	неудача
7102	25	limitation	ограничение
7103	25	transit	транзит
7104	25	bully	хулиган
7105	25	slavery	рабство
7106	25	workshop	мастерская
7107	25	reptile	пресмыкающееся
7108	25	exhibit	экспонат
7109	25	solitude	одиночество
7110	25	equivalent	эквивалент
7111	25	disapproval	неодобрение
7112	25	complication	осложнение
7113	25	yield	продуктивность
7114	25	corruption	коррупция
7115	25	speciality	специальность
7116	25	initiative	инициатива
7117	25	rectangle	прямоугольник
7118	25	pregnancy	беременность
7119	25	ounce	унция (28,349 г)
7120	25	glamour	роскошь
7121	25	homeland	родина
7122	25	refusal	отказ
7123	25	agenda	повестка дня
7124	25	adviser	советник
7125	25	texture	текстура
7126	25	disorder	расстройство
7127	25	junction	перекресток
7128	25	norm	норма
7129	25	transaction	транзакция
7130	25	segment	сегмент
7131	25	transformation	преобразование
7132	25	start-up	стартап
7133	25	administrator	администратор
7134	25	diesel	дизель
7135	25	violation	нарушение
7136	25	launch	запуск
7137	25	elite	элита
7138	25	regard	уважение
7139	25	coordinator	координатор
7140	25	unity	единство
7141	25	simplicity	простота
7142	25	processor	процессор
7143	25	memo	служебная записка
7144	25	provision	положение
7145	25	guerrilla	партизан
7146	25	dismissal	увольнение
7147	25	rating	оценка
7148	25	offering	предложение
7149	25	cutting	черенок
7150	25	outing	выход
7151	25	housing	жилье
7152	25	passing	прохождение
7153	25	shipping	доставка
7154	25	funding	финансирование
7155	25	handling	обслуживание
7156	25	directory	справочник
7157	25	developer	застройщик
7158	25	reconstruction	реконструкция
7159	25	marketplace	маркетплейс
7160	25	ecology	экология
7161	25	dedication	преданность
7162	25	configuration	конфигурация
7163	25	documentation	документация
7164	25	commentary	комментарий
7165	25	coordination	координация
7166	25	inability	неспособность
7167	25	portfolio	портфель
7168	25	vacancy	вакансия
7169	25	regulator	регулятор
7170	25	deployment	развертывание
7171	25	presumption	презумпция
7172	25	restoration	восстановление
7173	25	revenue	доход
7174	25	appliance	бытовой прибор
7175	25	harassment	домогательство
7176	25	modification	модификация
7177	25	manipulation	манипуляция
7178	25	infrastructure	инфраструктура
7179	25	participant	участник
7180	25	usage	употребление
7181	25	poll	опрос
7182	25	discourse	рассуждение
7183	25	completion	завершение
7184	25	prestige	престиж
7185	25	defect	дефект
7186	25	innovation	инновация
7187	25	trademark	торговая марка
7188	25	vulnerability	уязвимость
7189	25	elegance	элегантность
7190	25	register	реестр
7191	25	disrespect	неуважение
7192	25	commodity	сырьевой товар
7193	25	interaction	взаимодействие
7194	25	specification	спецификация
7195	25	bump	шишка
7196	25	ownership	владение
7197	25	deficiency	дефицит
7198	25	premise	предпосылка
7199	25	scholarship	стипендия
7200	25	archaeology	археология
7201	25	consistency	последовательность
7202	25	exaggeration	преувеличение
7203	25	aggression	агрессия
7204	25	indictment	обвинительный акт
7205	25	migration	миграция
7206	25	reproduction	воспроизведение
7207	25	legislature	законодательный орган
7208	25	simulation	симуляция
7209	25	compliance	согласие
7210	25	bail	залог
7211	25	accomplishment	достижение
7212	25	inmate	заключенный
7213	25	layout	макет
7214	25	constitution	конституция
7215	25	meditation	медитация
7216	25	stability	стабильность
7217	25	viewpoint	точка зрения
7218	25	clone	клон
7219	25	magistrate	судья
7220	25	outlet	выход
7221	25	doctrine	доктрина
7222	25	auction	аукцион
7223	25	spectrum	спектр
7224	25	attendance	посещаемость
7225	25	declaration	декларация
7226	25	firearm	огнестрельное оружие
7227	25	striker	забастовщик
7228	25	tackle	снаряжение
7229	25	pathway	путь
7230	25	detection	обнаружение
7231	25	interface	интерфейс
7232	25	nervousness	нервозность
7233	25	rotation	вращение
7234	25	coverage	охват
7235	25	jurisdiction	юрисдикция
7236	25	landmark	ориентир
7237	25	delegate	делегат
7238	25	petition	ходатайство
7239	25	pledge	залог
7240	25	allowance	пособие
7241	25	occurrence	происшествие
7242	25	mentor	ментор
7243	25	intake	потребление
7244	25	inconvenience	неудобство
7245	25	coolness	прохлада
7246	25	fixture	зажимное приспособление
7247	25	magnitude	величина
7248	25	correspondence	корреспонденция
7249	25	readiness	готовность
7250	25	jazz	джаз
7251	25	congregation	собрание
7252	25	span	пролет
7253	25	duration	продолжительность
7254	25	distribution	распределение
7255	25	creator	создатель
7256	25	solicitor	адвокат
7257	25	gallon	галлон (GB - 4,546 л; US - 3,784 л)
7258	25	pastry	сдобное тесто
7259	25	injustice	несправедливость
7260	25	bacterium	бактерия
7261	25	dictator	диктатор
7262	25	parish	приход
7263	25	suspension	подвеска
7264	25	protein	белок
7265	25	counterpart	копия
7266	25	residue	остаток
7267	25	footage	метраж
7268	25	illustration	иллюстрация
7269	25	sensitivity	чувствительность
7270	25	compensation	компенсация
7271	25	purity	чистота
7272	25	hardship	трудности
7273	25	alteration	изменение
7274	25	prosperity	процветание
7275	25	idol	идол
7276	25	morality	мораль
7277	25	contractor	подрядчик
7278	25	coalition	коалиция
7279	25	parameter	параметр
7280	25	submission	подчинение
7281	25	aftermath	последствие
7282	25	evaluation	обследование
7283	25	pastor	пастор
7284	25	germ	микроб
7285	25	abortion	аборт
7286	25	blindness	слепота
7287	25	outlook	перспектива
7288	25	detention	задержание
7289	25	hormone	гормон
7290	25	removal	удаление
7291	25	competence	компетентность
7292	25	liberation	освобождение
7293	25	therapist	терапевт
7294	25	transcript	расшифровка
7295	25	walker	ходок
7296	25	mammal	млекопитающее
7297	25	closeness	близость
7298	25	extinction	вымирание
7299	25	accessory	аксессуар
7300	25	liability	ответственность
7301	25	acquisition	приобретение
7302	25	abundance	изобилие
7303	25	trainee	стажер
7304	25	density	плотность
7305	25	trustee	попечитель
7306	25	deduction	дедукция
7307	25	pioneer	пионер
7308	25	asylum	убежище
7309	25	mustard	горчица
7310	25	disruption	разрушение
7311	25	emission	эмиссия
7312	25	spokesman	представитель
7313	25	programmer	программист
7314	25	orientation	ориентация
7315	25	atrocity	зверство
7316	25	fairness	справедливость
7317	25	assertion	утверждение
7318	25	correspondent	корреспондент
7319	25	ozone	озон
7320	25	drawback	недостаток
7321	25	consumption	потребление
7322	25	supervision	надзор
7323	25	setback	неудача
7324	25	downside	недостаток
7325	25	shyness	застенчивость
7326	25	recipient	получатель
7327	25	imagery	образность
7328	25	slogan	лозунг
7329	25	ratio	соотношение
7330	25	domination	господство
7331	25	citizenship	гражданство
7332	25	pipeline	трубопровод
7333	25	mobility	мобильность
7334	25	theology	теология
7335	25	usefulness	полезность
7336	25	mentality	менталитет
7337	25	default	умолчание
7338	25	backdrop	задник
7339	25	stamina	выносливость
7340	25	contestant	участник соревнования
7341	25	buffer	буфер
7342	25	slang	сленг
7343	25	ballot	избирательный бюллетень
7344	25	smog	смог
7345	25	syndrome	синдром
7346	25	memoir	научная статья
7347	25	allegation	заявление
7348	25	displacement	перемещение
7349	25	rudeness	грубость
7350	25	controversy	спор
7351	25	criterion	критерий
7352	25	nomination	назначение
7353	25	ideology	идеология
7354	25	preservation	сохранение
7355	25	discontent	недовольство
4108	22	way	путь
4109	22	moment	момент
4110	22	side	сторона
4111	22	person	персона
4112	22	back	задняя сторона
4113	22	mind	ум
4114	22	look	взгляд
4115	22	right	право
4116	22	idea	идея
4117	22	case	случай
4118	22	ground	земля
4119	22	set	набор
4120	22	point	точка
4121	22	reason	причина
4122	22	office	офис
4123	22	heart	сердце
4124	22	fact	факт
4125	22	rest	оставшаяся часть
4126	22	war	война
4127	22	sort	сорт
4128	22	bit	кусочек
4129	22	order	приказ
4130	22	surprise	сюрприз
4131	22	sense	чувство
4132	22	love	любовь
4133	22	story	рассказ
4134	22	kind	вид
4135	22	call	вызов
4136	22	lot	большое количество
4137	22	fear	страх
4138	22	control	контроль
4139	22	space	пространство
4140	22	pain	боль
4141	22	hope	надежда
4142	22	top	вершина
4143	22	corner	угол
4144	22	mile	миля
4145	22	police	полиция
4146	22	step	шаг
4147	22	system	система
4148	22	company	компания
4149	22	figure	фигура
4150	22	boat	лодка
4151	22	piece	кусок
4152	22	rock	рок
4153	22	past	прошлое
4154	22	neck	шея
4155	22	state	состояние
4156	22	field	поле
4157	22	pocket	карман
4158	22	smile	улыбка
4159	22	centre	центр
4160	22	machine	машина
4161	22	memory	память
4162	22	north	север
4163	22	skin	кожа
4164	22	interest	интерес
4165	22	plan	план
4166	22	sign	знак
4167	22	direction	направление
4168	22	gate	ворота
4169	22	knee	колено
4170	22	seat	сиденье
4171	22	information	информация
4172	22	screen	экран
4173	22	doctor	доктор
4174	22	wood	древесина
4175	22	secret	секрет
4176	22	dream	мечта
4177	22	stop	остановка
4178	22	mountain	гора
4179	22	god	бог
4180	22	age	возраст
4181	22	south	юг
4182	22	station	станция
4183	22	distance	дистанция
4184	22	party	вечеринка
4185	22	cold	холод
4186	22	show	шоу
4187	22	brain	мозг
4188	22	report	отчет
4189	22	noise	шум
4190	22	middle	середина
4191	22	cloud	облако
4192	22	situation	ситуация
4193	22	gold	золото
4194	22	view	вид
4195	22	bar	бар
4196	22	west	запад
4197	22	service	служба
4198	22	smoke	дым
4199	22	conversation	разговор
4200	22	suit	костюм
4201	22	form	форма
4202	22	hole	дыра
4203	22	path	тропинка
4204	22	apartment	апартаменты
4205	22	stairs	лестница
4206	22	crowd	толпа
4207	22	bridge	мост
4208	22	level	уровень
4209	22	future	будущее
4210	22	team	команда
4211	22	law	закон
4212	22	note	записка
4213	22	tone	тон
4214	22	image	изображение
4215	22	wine	вино
4216	22	yard	двор
4217	22	change	сдача
4218	22	choice	выбор
4219	22	island	остров
7356	25	geology	геология
7357	25	comeback	возвращение
4220	22	silver	серебро
4221	22	action	действие
4222	22	east	восток
4223	22	ring	кольцо
4224	22	command	приказ
4225	22	danger	опасность
4226	22	truck	грузовик
4227	22	bank	банк
4228	22	moon	луна
4229	22	forest	лес
4230	22	pair	пара
4231	22	running	бег
4232	22	storm	буря
4233	22	hotel	отель
4234	22	earth	земля
4235	22	walk	прогулка
4236	22	mark	отметина
4237	22	driver	водитель
4238	22	bottom	нижняя часть
4239	22	history	история
4240	22	engine	двигатель
4241	22	card	карта
4242	22	flight	полет
4243	22	uncle	дядя
4244	22	contact	контакт
4245	22	heat	тепло
4246	22	present	подарок
4247	22	circle	круг
4248	22	detail	деталь
4249	22	soul	душа
4250	22	hospital	больница
4251	22	member	член
4252	22	roof	крыша
4253	22	quarter	четверть
4254	22	size	размер
4255	22	belt	ремень
4256	22	difference	различие
4257	22	final	финал
4258	22	church	церковь
4259	22	president	президент
4260	22	mirror	зеркало
4261	22	luck	удача
4262	22	entrance	вход
4263	22	plane	самолет
4264	22	board	доска
4265	22	wheel	колесо
4266	22	file	файл
4267	22	metre	метр
4268	22	century	век
4269	22	beer	пиво
4270	22	chance	шанс
4271	22	base	база
4272	22	sleep	сон
4273	22	stone	камень
4274	22	stomach	желудок
4275	22	lake	озеро
4276	22	beach	пляж
4277	22	sheet	лист
4278	22	guest	гость
4279	22	map	карта
4280	22	break	перерыв
4281	22	park	парк
4282	22	nature	природа
4283	22	play	пьеса
4284	22	subject	предмет
4285	22	pilot	пилот
4286	22	supermarket	супермаркет
4287	22	camera	камера
4288	22	trip	поездка
4289	22	castle	замок
4290	22	cigarette	сигарета
4291	22	uniform	униформа
4292	22	ceiling	потолок
4293	22	cheque	чек
4294	22	art	искусство
4295	22	accident	несчастный случай
4296	22	plastic	пластик
4297	22	price	цена
4298	22	fun	веселье
4299	22	pool	бассейн
4300	22	course	курс
4301	22	gift	подарок
4302	22	condition	состояние
4303	22	ship	корабль
4304	22	passenger	пассажир
4305	22	traffic	дорожное движение
4306	22	term	термин
4307	22	alarm	сигнализация
4308	22	plant	растение
4309	22	chain	цепь
4310	22	front	передняя часть
4311	22	meal	еда
4312	22	gas	газ
4313	22	cousin	двоюродная сестра или брат
4314	22	blanket	одеяло
4315	22	club	клуб
4316	22	matter	вопрос для рассмотрения
4317	22	meeting	встреча
4318	22	elevator	лифт
4319	22	programme	программа
4320	22	aunt	тётя
4321	22	nurse	медсестра
4322	22	beginning	начало
4323	22	band	музыкальная группа
4324	22	library	библиотека
4325	22	ocean	океан
4326	22	walking	ходьба
4327	22	human	человеческое существо
4328	22	expression	выражение
4329	22	death	смерть
4330	22	power	власть
4331	22	match	матч
4332	22	boss	босс
4333	22	journey	путешествие
4334	22	type	тип
4335	22	shoulder	плечо
4336	22	couch	диван
4337	22	post	почта
4338	22	offer	предложение (чего-либо)
4339	22	rat	крыса
4340	22	telephone	телефон
4341	22	lamp	лампа
4342	22	blood	кровь
4343	22	lady	леди
4344	22	notice	извещение
4345	22	bowl	миска
4346	22	tool	инструмент
4347	22	newspaper	газета
4348	22	gun	пистолет
4349	22	department	отдел
4350	22	neighbour	сосед
4351	22	copy	копия
4352	22	address	адрес
4353	22	care	забота
4354	22	talk	разговор
4355	22	trouble	неприятность
4356	22	project	проект
4357	22	square	площадь
4358	22	study	исследование
4359	22	oil	масло
4360	22	cause	причина
4361	22	visitor	посетитель
4362	22	officer	офицер
4363	22	bill	счет
4364	22	science	наука
4365	22	farm	ферма
4366	22	tyre	шина
4367	22	kilometre	километр
4368	22	theatre	театр
4369	22	jewellery	украшение
4370	22	fridge	холодильник
4371	22	train	поезд
4372	22	toy	игрушка
4373	22	sale	продажа
4374	22	wallet	бумажник
4375	22	dish	блюдо
4376	22	engineer	инженер
4377	22	instrument	инструмент
4378	22	market	рынок
4379	22	photograph	фотография
4380	22	envelope	конверт
4381	22	pound	фунт (453,59 г)
4382	22	platform	платформа
4383	22	instruction	инструкция
4384	22	painting	живопись
4385	22	parking	парковка
4386	22	cash	наличные деньги
4387	22	midnight	полночь
4388	22	activity	активность
4389	22	advice	совет
4390	22	glove	перчатка
4391	22	college	колледж
4392	22	shower	душ
4393	22	fog	туман
4394	22	fashion	мода
4395	22	magazine	журнал
4396	22	assistant	помощник
4397	22	university	университет
4398	22	toe	палец ноги
4399	22	pillow	подушка
4400	22	sir	сэр
4401	22	highway	автомагистраль
4402	22	carpet	ковер
4403	22	exercise	упражнение
4404	22	closet	шкаф
4405	22	airport	аэропорт
4406	22	area	область
4407	22	position	позиция
4408	22	player	игрок
4409	22	mug	кружка
4410	22	adult	взрослый человек
4411	22	honey	мёд
4412	22	exit	выход
4413	22	towel	полотенце
4414	22	cabinet	шкаф
4415	22	farmer	фермер
4416	22	brush	щетка
4417	22	furniture	мебель
4418	22	health	здоровье
4419	22	ticket	билет
4420	22	mail	почта
4421	22	capital	столица
4422	22	supper	ужин
4423	22	chicken	курица
4424	22	document	документ
4425	22	adventure	приключение
4426	22	video	видео
4427	22	tour	тур
4428	22	sofa	диван
4429	22	policeman	полицейский
4430	22	manager	менеджер
4431	22	artist	художник
4432	22	tourist	турист
4433	22	notebook	блокнот
4434	22	temperature	температура
4435	22	goal	цель
4436	22	monkey	обезьяна
4437	22	waiter	официант
4438	22	factory	завод
4439	22	cream	сливки
4440	22	snake	змея
4441	22	ruler	правитель
4442	22	ID	идентификатор
4443	22	wool	шерсть
4444	22	metal	металл
4445	22	prize	приз
4446	22	stove	печь
4447	22	waitress	официантка
4448	22	museum	музей
4449	22	rabbit	кролик
4450	22	hare	заяц
4451	22	tiger	тигр
4452	22	cook	повар
4453	22	sweet	сладкое
4454	22	lift	лифт
4455	22	tie	галстук
4456	22	puzzle	головоломка
4457	22	wash	мытье
4458	22	army	армия
4459	22	kiss	поцелуй
4460	22	paint	краска
4461	22	underground	метро
4462	22	practise	практика
4463	22	singer	певец
4464	22	dancer	танцор
4465	22	soap	мыло
4466	22	passport	паспорт
4467	22	armchair	кресло
4468	22	candy	конфета
4469	22	balloon	воздушный шар
4470	22	bean	фасоль
4471	22	Christmas	Рождество
4472	22	baseball	бейсбол
4473	22	queen	королева
4474	22	piano	фортепиано
4475	22	cupboard	шкаф
4476	22	rainbow	радуга
4477	22	slice	ломтик
4478	22	keyboard	клавиатура
4479	22	swimming	плавание
4480	22	can	жестяная банка
4481	22	website	сайт
4482	22	king	король
4483	22	use	использование
4484	22	couple	пара
4485	22	ham	ветчина
4486	22	steak	стейк
4487	22	menu	меню
4488	22	cookie	печенье
4489	22	umbrella	зонтик
4490	22	teenager	подросток
4491	22	grandson	внук
4492	22	centimetre	сантиметр
4493	22	thought	мысль
4494	22	bicycle	велосипед
4495	22	attention	внимание
4496	22	soldier	солдат
4497	22	guess	догадка
4498	22	hill	холм
4499	22	rice	рис
4500	22	railroad	железная дорога
4501	22	sunglasses	солнцезащитные очки
4502	22	bear	медведь
4503	22	cooking	приготовление пищи
4504	22	mushroom	гриб
4505	22	planet	планета
4506	22	guitar	гитара
4507	22	rent	арендная плата
4508	22	ski	лыжа
4509	22	chess	шахматы
4510	22	winner	победитель
4511	22	opera	опера
4512	22	railway	железная дорога
4513	22	suitcase	чемодан
4514	22	concert	концерт
4515	22	actress	актриса
4516	22	smartphone	смартфон
4517	22	mobile	мобильный телефон
4518	22	blog	блог
4519	22	photographer	фотограф
4520	22	painter	художник
4521	22	calendar	календарь
4522	22	burger	бургер
4523	22	grape	виноград
4524	22	bookshelf	книжная полка
4525	22	camping	кемпинг
4526	22	hobby	хобби
4527	22	bookcase	книжный шкаф
4528	22	album	альбом
4529	22	dentist	зубной врач
4530	22	exam	экзамен
4531	22	granddaughter	внучка
4532	22	bookshop	книжный магазин
4533	22	jam	джем
4534	22	cartoon	мультфильм
4535	22	vocabulary	лексика
4536	22	scissors	ножницы
4537	22	cinema	кинотеатр
4538	22	tower	башня
4539	22	euro	евро
4540	22	green	зеленый цвет
4541	22	roast	жаркое
4542	22	studies	учеба
4543	22	printer	принтер
4544	22	comb	расческа
4545	22	melon	дыня
4546	22	postcard	открытка
4547	22	gram	грамм
4548	22	pear	груша
4549	22	barbecue	барбекю
4550	22	pasta	макароны
4551	22	toothpaste	зубная паста
4552	22	cooker	кухонная плита
4553	22	classmate	одноклассник
4554	22	toothbrush	зубная щетка
4555	22	grammar	грамматика
4556	22	textbook	учебник
4557	22	penguin	пингвин
4558	22	kilogram	килограмм
4559	22	yogurt	йогурт
4560	22	shampoo	шампунь
4561	22	skiing	катание на лыжах
4562	22	pineapple	ананас
4563	22	blackboard	классная доска
4564	22	spelling	правописание
4565	22	millimetre	миллиметр
4566	22	skateboard	скейтборд
4567	22	workbook	рабочая тетрадь
4568	22	surname	фамилия
4569	22	hockey	хоккей на траве
4570	22	soccer	футбол
4571	22	litre	литр
4572	22	giraffe	жираф
4573	22	skating	катание на коньках
4574	22	basketball	баскетбол
4575	22	volleyball	волейбол
4576	22	kangaroo	кенгуру
4577	22	noun	существительное
4578	22	verb	глагол
4579	22	adjective	прилагательное
4580	22	adverb	наречие
4581	22	pronoun	местоимение
4582	22	preposition	предлог (в грамматике)
4583	22	conjunction	союз
4584	22	determiner	определяющее слово
4585	22	numeral	числительное
4586	22	infinitive	неопределенная форма глагола
4587	22	punctuation	пунктуация
4588	19	man	мужчина
4589	19	time	время
4590	19	hand	рука
4591	19	eye	глаз
4592	19	thing	вещь
4593	19	head	голова
4594	19	face	лицо
4595	19	door	дверь
4596	19	day	день
4597	19	room	комната
4598	19	year	год
4599	19	woman	женщина
4600	19	place	место
4601	19	life	жизнь
4602	19	voice	голос
4603	19	night	ночь
4604	19	foot	нога
4605	19	word	слово
4606	19	light	свет
4607	19	arm	рука
4608	19	house	дом
4609	19	world	мир
4610	19	father	отец
4611	19	people	люди
4612	19	wall	стена
4613	19	work	работа
4614	19	body	тело
4615	19	water	вода
4616	19	name	имя
4617	19	minute	минута
4618	19	friend	друг
4619	19	car	легковой автомобиль
4620	19	girl	девушка
4621	19	hour	час
4622	19	end	конец
4623	19	child	ребенок
4624	19	air	воздух
4625	19	help	помощь
4626	19	boy	мальчик
4627	19	mother	мать
4628	19	table	стол
4629	19	sound	звук
4630	19	question	вопрос
4631	19	part	часть
4632	19	window	окно
4633	19	hair	волос
4634	19	floor	пол
4635	19	morning	утро
4636	19	city	большой город
4637	19	finger	палец
4638	19	bed	кровать
4639	19	street	улица
4640	19	mouth	рот
4641	19	fire	огонь
4642	19	chair	стул
4643	19	tree	дерево
4644	19	second	секунда
4645	19	money	деньги
4646	19	road	дорога
4647	19	brother	брат
4648	19	leg	нога
4649	19	home	дом
4650	19	week	неделя
4651	19	Sunday	воскресенье
4652	19	Monday	понедельник
4653	19	Tuesday	вторник
4654	19	Wednesday	среда
4655	19	Thursday	четверг
4656	19	Friday	пятница
4657	19	Saturday	суббота
4658	19	family	семья
4659	19	son	сын
4660	19	answer	ответ
4661	19	book	книга
4662	19	job	работа
4663	19	phone	телефон
4664	19	wife	жена
4665	19	business	бизнес
4666	19	glass	стекло
4667	19	problem	проблема
4668	19	January	январь
4669	19	February	февраль
4670	19	March	март
4671	19	April	апрель
4672	19	May	май
4673	19	June	июнь
4674	19	July	июль
4675	19	August	август
4676	19	September	сентябрь
4677	19	October	октябрь
4678	19	November	ноябрь
4679	19	December	декабрь
4680	19	number	число
4681	19	half	половина
4682	19	paper	бумага
4683	19	town	небольшой город
4684	19	sun	солнце
4685	19	hall	зал
4686	19	Miss	мисс
4687	19	month	месяц
4688	19	sky	небо
4689	19	desk	письменный стол
4690	19	ear	ухо
4691	19	star	звезда
4692	19	sea	море
4693	19	wind	ветер
4694	19	dog	собака
4695	19	land	земля
4696	19	food	еда
4697	19	building	здание
4698	19	river	река
4699	19	sister	сестра
4700	19	picture	картина
4701	19	evening	вечер
4702	19	message	сообщение
4703	19	group	группа
4704	19	news	новость
4705	19	game	игра
4706	19	daughter	дочь
4707	19	box	коробка
4708	19	husband	муж
4709	19	kitchen	кухня
4710	19	tooth	зуб
4711	19	bag	сумка
4712	19	country	страна
4713	19	school	школа
4714	19	letter	письмо
4715	19	nose	нос
4716	19	animal	животное
4717	19	colour	цвет
4718	19	knife	нож
4719	19	afternoon	полдень
4720	19	key	ключ
4721	19	dinner	основной прием пищи (обед или ужин)
4722	19	coffee	кофе
4723	19	baby	малыш
4724	19	clothes	одежда
4725	19	computer	компьютер
4726	19	rain	дождь
4727	19	cat	кошка
4728	19	snow	снег
4729	19	bird	птица
4730	19	bottle	бутылка
4731	19	watch	часы
4732	19	ice	лед
4733	19	shirt	рубашка
4734	19	cup	чашка
4735	19	clock	часы
4736	19	fall	падение
4737	19	grass	трава
4738	19	summer	лето
4739	19	village	деревня
4740	19	flat	квартира
4741	19	language	язык
4742	19	winter	зима
4743	19	drink	напиток
4744	19	boot	ботинок
4745	19	music	музыка
4746	19	parent	родитель
4747	19	bedroom	спальня
4748	19	garden	сад
4749	19	jacket	куртка
4750	19	fish	рыба
4751	19	radio	радио
4752	19	coat	пальто
4753	19	plate	тарелка
4754	19	page	страница
4755	19	text	текст
4756	19	shop	магазин
4757	19	dad	папа
4758	19	breakfast	завтрак
4759	19	ball	мяч
4760	19	shoe	туфля
4761	19	tea	чай
4762	19	English	английский язык
4763	19	dollar	доллар
4764	19	hat	шляпа
4765	19	mistake	ошибка
4766	19	tomorrow	завтрашний день
4767	19	lunch	обед
4768	19	list	список
4769	19	song	песня
4770	19	dance	танец
4771	19	weather	погода
4772	19	class	класс
4773	19	store	магазин
4774	19	flower	цветок
4775	19	egg	яйцо
4776	19	meat	мясо
4777	19	line	линия
4778	19	test	тест
4779	19	beard	борода
4780	19	bathroom	ванная комната
4781	19	student	студент
4782	19	movie	кино
4783	19	pen	ручка
4784	19	spring	весна
4785	19	bread	хлеб
4786	19	orange	апельсин
4787	19	bus	автобус
4788	19	reading	чтение
4789	19	mister	мистер
4790	19	taxi	такси
4791	19	sandwich	бутерброд
4792	19	girlfriend	подруга
4793	19	autumn	осень
4794	19	cheese	сыр
4795	19	juice	сок
4796	19	vegetable	овощ
4797	19	sugar	сахар
4798	19	date	дата
4799	19	restaurant	ресторан
4800	19	grandfather	дедушка
4801	19	photo	фотография
4802	19	example	пример
4803	19	lesson	урок
4804	19	pants	брюки
4805	19	film	фильм
4806	19	fruit	фрукт
4807	19	teacher	учитель
4808	19	skirt	юбка
4809	19	sentence	предложение в тексте
4810	19	bath	ванна
4811	19	television	телевидение
4812	19	jeans	джинсы
4813	19	grandmother	бабушка
4814	19	trousers	брюки
4815	19	apple	яблоко
4816	19	milk	молоко
4817	19	weekend	выходной день
4818	19	salt	соль
4819	19	pig	свинья
4820	19	sport	спорт
4821	19	soup	суп
4822	19	sheep	овца
4823	19	birthday	день рождения
4824	19	holiday	праздник
4825	19	cake	торт
4826	19	toilet	туалет
4827	19	bike	велосипед
4828	19	pencil	карандаш
4829	19	fork	вилка
4830	19	vacation	отпуск
4831	19	mouse	мышь
4832	19	doll	кукла
4833	19	sweater	свитер
4834	19	blouse	блузка
4835	19	pie	пирог
4836	19	sock	носок
4837	19	cow	корова
4838	19	chocolate	шоколад
4839	19	butter	масло
4840	19	elephant	слон
4841	19	lion	лев
4842	19	internet	интернет
4843	19	glasses	очки
4844	19	England	Англия
4845	19	dancing	танец
4846	19	dress	платье
4847	19	T-shirt	футболка
4848	19	potato	картофель
4849	19	spoon	ложка
4850	19	cent	цент
4851	19	boyfriend	парень
4852	19	email	электронная почта
4853	19	football	футбол
4854	19	scarf	шарф
4855	19	classroom	класс
4856	19	horse	лошадь
4857	19	cafe	кафе
4858	19	lemon	лимон
4859	19	pizza	пицца
4860	19	salad	салат
4861	19	tennis	теннис
4862	19	pepper	перец
4863	19	homework	домашнее задание
4864	19	onion	репчатый лук
4865	19	duck	утка
4866	19	sausage	колбаса
4867	19	zoo	зоопарк
4868	19	banana	банан
4869	19	tomato	помидор
4870	19	carrot	морковь
4871	19	strawberry	клубника
4872	19	cucumber	огурец
4873	19	dictionary	словарь
4874	19	alphabet	алфавит
4875	19	eraser	ластик
4876	23	wonder	чудо
4877	23	feeling	чувство
4878	23	being	существо
4879	23	things	дела
4880	23	agent	агент
4881	23	duty	обязанность
4882	23	flame	пламя
4883	23	track	тропа
4884	23	race	гонка
4885	23	court	суд
4886	23	movement	движение
4887	23	weight	вес
4888	23	speed	скорость
4889	23	block	квартал
4890	23	camp	лагерь
4891	23	scene	сцена
4892	23	wing	крыло
4893	23	leader	лидер
4894	23	effect	воздействие
4895	23	energy	энергия
4896	23	tongue	язык
4897	23	spot	пятно
4898	23	government	правительство
4899	23	purpose	цель
4900	23	folk	народ
4901	23	van	фургон
4902	23	handle	рукоятка
4903	23	experience	опыт
4904	23	operation	операция
4905	23	knowledge	знание
4906	23	rule	правило
4907	23	staff	персонал
4908	23	iron	железо
4909	23	bell	колокол
4910	23	dust	пыль
4911	23	decision	решение
4912	23	event	событие
4913	23	tunnel	туннель
4914	23	pleasure	удовольствие
4915	23	ghost	призрак
4916	23	shock	шок
4917	23	peace	мир
4918	23	stick	палка
4919	23	while	некоторое время
4920	23	trust	доверие
4921	23	wolf	волк
4922	23	prince	принц
4923	23	wish	желание
4924	23	good	добро
4925	23	pay	оплата
4926	23	act	поступок
4927	23	smell	запах
4928	23	record	запись
4929	23	like	нечто подобное
4930	23	little	небольшое количество
4931	23	visit	посещение
4932	23	forehead	лоб
4933	23	leather	кожа (материал)
4934	23	vehicle	транспортное средство
4935	23	cover	покров
4936	23	priest	священник
4937	23	chin	подбородок
4938	23	unit	подразделение
4939	23	sand	песок
4940	23	crime	преступление
4941	23	prisoner	заключенный
4942	23	inch	дюйм (2,54 см)
4943	23	temple	храм
4944	23	button	пуговица
4945	23	account	счет
4946	23	valley	долина
4947	23	pattern	шаблон
4948	23	palace	дворец
4949	23	lawyer	юрист
4950	23	detective	детектив
4951	23	result	результат
4952	23	rider	всадник
4953	23	object	объект
4954	23	giant	гигант
4955	23	tent	палатка
4956	23	respect	уважение
4957	23	cry	плач
4958	23	count	подсчет
4959	23	laughter	смех
4960	23	defence	защита
4961	23	equipment	экипировка
4962	23	attempt	попытка
4963	23	length	длина
4964	23	section	секция
4965	23	branch	ветвь
4966	23	cave	пещера
4967	23	support	поддержка
4968	23	breast	грудь
4969	23	judge	судья
4970	23	trail	тропа
4971	23	range	диапазон
4972	23	dark	темнота
4973	23	possibility	возможность
4974	23	favour	одолжение
4975	23	row	ряд
4976	23	monster	монстр
4977	23	laboratory	лаборатория
4978	23	heel	пятка
4979	23	wave	волна
4980	23	process	процесс
4981	23	port	порт
4982	23	universe	вселенная
4983	23	connection	соединение
4984	23	killer	убийца
4985	23	shore	побережье
4986	23	bay	бухта
4987	23	advantage	преимущество
4988	23	opportunity	возможность
4989	23	trick	трюк
4990	23	marriage	брак
4991	23	turn	поворот
4992	23	skill	навык
4993	23	communication	коммуникация
4994	23	dirt	грязь
4995	23	ability	способность
4996	23	stream	поток
4997	23	trade	торговля
4998	23	opinion	мнение
4999	23	mess	беспорядок
5000	23	sunlight	солнечный свет
5001	23	beauty	красота
5002	23	cliff	скала
5003	23	taste	вкус
5004	23	character	характер
5005	23	elbow	локоть
5006	23	search	поиск
5007	23	speech	речь
5008	23	fault	вина
5009	23	joke	шутка
5010	23	mood	настроение
5011	23	tube	трубка
5012	23	stuff	вещь
5013	23	breeze	легкий ветер
5014	23	excitement	волнение
5015	23	shape	форма
5016	23	tape	лента
5017	23	excuse	оправдание
5018	23	stage	этап
5019	23	damage	урон
5020	23	argument	аргумент
5021	23	trunk	ствол дерева
5022	23	pipe	труба
5023	23	height	высота
5024	23	cap	кепка
5025	23	signal	сигнал
5026	23	secretary	секретарь
5027	23	hero	герой
5028	23	partner	партнер
5029	23	amount	количество
5030	23	missile	реактивный снаряд
5031	23	lock	замок
5032	23	mystery	тайна
5033	23	success	успех
5034	23	coast	побережье
5035	23	original	оригинал
5036	23	talent	талант
5037	23	society	общество
5038	23	reply	ответ
5039	23	horizon	горизонт
5040	23	appearance	появление
5041	23	force	сила
5042	23	research	исследование
5043	23	coin	монета
5044	23	move	движение
5045	23	professor	профессор
5046	23	site	место
5047	23	series	серия
5048	23	explanation	объяснение
5049	23	sleeve	рукав
5050	23	credit	кредит
5051	23	robot	робот
5052	23	drawer	выдвижной ящик
5053	23	candle	свеча
5054	23	degree	градус
5055	23	pile	стопка
5056	23	route	маршрут
5057	23	emergency	чрезвычайная ситуация
5058	23	curtain	штора
5059	23	habit	привычка
5060	23	property	собственность
5061	23	twin	близнец
5062	23	promise	обещание
5063	23	thumb	большой палец руки
5064	23	frame	рамка
5065	23	grave	могила
5066	23	pot	горшок
5067	23	tip	чаевые
5068	23	humour	юмор
5069	23	display	дисплей
5070	23	lightning	молния
5071	23	youth	молодежь
5072	23	security	безопасность
5073	23	access	доступ
5074	23	nightmare	кошмар
5075	23	value	значение
5076	23	fence	забор
5077	23	garage	гараж
5078	23	shelf	полка
5079	23	desert	пустыня
5080	23	relationship	связь
5081	23	ladder	приставная лестница
5082	23	generation	поколение
5083	23	difficulty	трудность
5084	23	scream	вопль
5085	23	navy	военно-морской флот
5086	23	cab	такси
5087	23	lack	нехватка
5088	23	director	директор
5089	23	cage	клетка
5090	23	sex	пол
5091	23	background	фон
5092	23	season	сезон
5093	23	lover	любовник
5094	23	period	период
5095	23	effort	усилие
5096	23	comment	комментарий
5097	23	shade	оттенок
5098	23	fur	мех
5099	23	harbour	гавань
5100	23	audience	аудитория
5101	23	career	карьера
5102	23	pit	яма
5103	23	channel	канал
5104	23	scientist	ученый
5105	23	comfort	комфорт
5106	23	ankle	щиколотка
5107	23	breathing	дыхание
5108	23	challenge	сложная задача
5109	23	request	запрос
5110	23	conference	конференция
5111	23	novel	роман
5112	23	warning	предупреждение
5113	23	bunch	куча
5114	23	criminal	преступник
5115	23	attitude	отношение
5116	23	neighbourhood	окрестности
5117	23	writer	писатель
5118	23	occasion	случай
5119	23	helicopter	вертолет
5120	23	owner	владелец
5121	23	depth	глубина
5122	23	repeat	повторение
5123	23	arrival	прибытие
5124	23	location	расположение
5125	23	border	граница
5126	23	behaviour	поведение
5127	23	gap	щель
5128	23	thunder	гром
5129	23	fool	дурак
5130	23	jungle	джунгли
5131	23	score	счет в игре
5132	23	edge	край
5133	23	jet	струя
5134	23	cheeseburger	чизбургер
5135	23	patient	пациент
5136	23	noon	полдень
5137	23	progress	прогресс
5138	23	material	материал
5139	23	prayer	молитва
5140	23	clue	подсказка
5141	23	silence	тишина
5142	23	speaker	спикер
5143	23	fuel	топливо
5144	23	collar	воротник
5145	23	atmosphere	атмосфера
5146	23	mate	приятель
5147	23	start	начало
5148	23	style	стиль
5149	23	expert	эксперт
5150	23	item	пункт
5151	23	worker	рабочий
5152	23	thinking	раздумья
5153	23	silk	шелк
5154	23	captain	капитан
5155	23	breath	дыхание
5156	23	lip	губа
5157	23	district	район
5158	23	stranger	незнакомец
5159	23	issue	вопрос
5160	23	weapon	оружие
5161	23	murderer	убийца
5162	23	seal	печать
5163	23	suggestion	предложение
5164	23	princess	принцесса
5165	23	routine	заведенный порядок
5166	23	arrangement	расположение
5167	23	shame	стыд
5168	23	cable	канат
5169	23	pity	жалость
5170	23	technology	технология
5171	23	birth	рождение
5172	23	reporter	репортер
5173	23	fight	драка
5174	23	link	ссылка
5175	23	rhyme	рифма
5176	23	rescue	спасение
5177	23	spy	шпион
5178	23	sailor	моряк
5179	23	truth	правда
5180	23	liquid	жидкость
5181	23	rail	рельс
5182	23	shadow	тень
5183	23	sight	зрелище
5184	23	sidewalk	тротуар
5185	23	interview	интервью
5186	23	customer	клиент
5187	23	collection	коллекция
5188	23	pirate	пират
5189	23	thief	вор
5190	23	disc	диск
5191	23	doubt	сомнение
5192	23	role	роль
5193	23	model	модель
5194	23	statue	статуя
5195	23	method	метод
5196	23	imagination	воображение
5197	23	title	название
5198	23	discussion	дискуссия
5199	23	software	программное обеспечение
5200	23	protest	протест
5201	23	agency	агентство
5202	23	contract	контракт
5203	23	decade	декада
5204	23	deal	сделка
5205	23	return	возвращение
5206	23	leaf	лист
5207	23	jail	тюрьма
5208	23	entry	вход
5209	23	permission	разрешение
5210	23	battle	битва
5211	23	expedition	экспедиция
5212	23	option	выбор
5213	23	volume	объем
5214	23	conclusion	умозаключение
5215	23	honour	честь
5216	23	native	местный житель
5217	23	fever	лихорадка
5218	23	firm	фирма
5219	23	solution	решение
5220	23	waste	отходы
5221	23	accent	акцент
5222	23	attack	атака
5223	23	chip	обломок
5224	23	cottage	коттедж
5225	23	dozen	дюжина
5226	23	benefit	выгода
5227	23	outside	внешняя сторона
5228	23	description	описание
5229	23	cheek	щека
5230	23	culture	культура
5231	23	relative	родственник
5232	23	league	лига
5233	23	appointment	запланированная встреча
5234	23	bull	бык
5235	23	run	пробежка
5236	23	plenty	изобилие
5237	23	bucket	ведро
5238	23	development	развитие
5239	23	basket	корзина
5240	23	union	объединение
5241	23	hut	изба
5242	23	influence	влияние
5243	23	corridor	коридор
5244	23	medicine	медицина
5245	23	organisation	организация
5246	23	disease	болезнь
5247	23	buck	бакс
5248	23	purse	портмоне
5249	23	population	численность населения
5250	23	zone	зона
5251	23	politics	политика
5252	23	chapter	глава
5253	23	phrase	фраза
5254	23	balcony	балкон
5255	23	spirit	дух
5256	23	ruin	руины
5257	23	traveler	путешественник
5258	23	facility	установка
5259	23	kit	комплект
5260	23	magic	магия
5261	23	repair	ремонт
5262	23	assignment	назначение
5263	23	ceremony	церемония
5264	23	charge	заряд
5265	23	religion	религия
5266	23	bug	жук
5267	23	article	статья
5268	23	sunset	заход солнца
5269	23	switch	переключатель
5270	23	region	регион
5271	23	invitation	приглашение
5272	23	peak	вершина
5273	23	single	сингл
5274	23	fiction	вымысел
5275	23	pill	таблетка
5276	23	moustache	усы
5277	23	quality	качество
5278	23	destination	место назначения
5279	23	fine	штраф
5280	23	custom	обычай
5281	23	licence	лицензия
5282	23	experiment	эксперимент
5283	23	childhood	детство
5284	23	penny	пенни
5285	23	reader	читатель
5286	23	enquiry	запрос
5287	23	battery	батарейка
5288	23	flag	флаг
5289	23	transport	транспорт
5290	23	performance	представление
5291	23	importance	важность
5292	23	friendship	дружба
5293	23	web	сеть
5294	23	spider	паук
5295	23	hunger	голод
5296	23	blank	бланк
5297	23	reception	прием
5298	23	landscape	ландшафт
5299	23	goods	товары
5300	23	insect	насекомое
5301	23	vote	голосование
5302	23	divorce	развод
5303	23	studio	студия
5304	23	sink	раковина
5305	23	fan	вентилятор
5306	23	rug	ковер
5307	23	pavement	тротуар
5308	23	tax	налог
5309	23	drum	барабан
5310	23	delay	задержка
5311	23	happiness	счастье
5312	23	pass	проход
5313	23	cotton	хлопок
5314	23	kick	пинок
5315	23	coach	тренер
5316	23	addition	дополнение
5317	23	session	официальная встреча
5318	23	rubber	резина
5319	23	gallery	галерея
5320	23	continent	континент
5321	23	grant	грант
5322	23	complaint	жалоба
5323	23	guide	наставник
5324	23	author	автор
5325	23	lead	лидерство
5326	23	lie	ложь
5327	23	relation	связь
5328	23	turning	перекресток
5329	23	brand	бренд
5330	23	tin	олово
5331	23	demand	требование
5332	23	preparation	подготовка
5333	23	handkerchief	носовой платок
5334	23	drive	поездка
5335	23	keeper	вратарь
5336	23	make-up	макияж
5337	23	education	образование
5338	23	runner	бегун
5339	23	guard	охранник
5340	23	product	продукт
5341	23	fountain	фонтан
5342	23	employee	сотрудник
5343	23	schedule	расписание
5344	23	crash	крах
5345	23	pull	тяга
5346	23	colleague	коллега
5347	23	poem	стихотворение
5348	23	disappointment	разочарование
5349	23	reward	награда
5350	23	environment	окружающая среда
5351	23	stall	ларек
5352	23	design	дизайн
5353	23	powder	порошок
5354	23	limit	установленное ограничение
5355	23	canal	канал
5356	23	wedding	свадьба
5357	23	departure	отъезд
5358	23	laugh	смех
5359	23	total	итог
5360	23	apology	извинение
5361	23	delivery	доставка
5362	23	prison	тюрьма
5363	23	technique	техника
5364	23	poet	поэт
5365	23	load	нагрузка
5366	23	jar	банка
5367	23	ambulance	скорая помощь
5368	23	tissue	ткань
5369	23	whole	единое целое
5370	23	trash	мусор
5371	23	subway	метро
5372	23	flavour	вкус
5373	23	poster	плакат
5374	23	virus	вирус
5375	23	luggage	багаж
5376	23	businessman	бизнесмен
5377	23	hardware	аппаратура
5378	23	cross	крест
5379	23	grandchild	внук или внучка
5380	23	content	контент
5381	23	electricity	электричество
5382	23	backyard	задний двор
5383	23	exchange	обмен
5384	23	niece	племянница
5385	23	biscuit	печенье
5386	23	enemy	враг
5387	23	topic	тема
5388	23	gym	спортзал
5389	23	saucer	блюдце
5390	23	pin	штифт
5391	23	tune	мелодия
5503	23	perfume	духи
5392	23	pet	домашний питомец
5393	23	brake	тормоз
5394	23	bargain	сделка
5395	23	shopping	покупка товаров
5396	23	pump	насос
5397	23	attraction	привлекательность
5398	23	flood	наводнение
5399	23	rap	рэп
5400	23	cushion	диванная подушка
5401	23	drawing	рисование
5402	23	actor	актер
5403	23	greeting	приветствие
5404	23	meaning	значение
5405	23	sailing	парусный спорт
5406	23	racing	гонка
5407	23	training	тренировка
5408	23	flying	полет
5409	23	driving	поездка на машине
5410	23	fishing	рыбалка
5411	23	engineering	инженерия
5412	23	tearing	разрыв
5413	23	nephew	племянник
5414	23	stress	стресс
5415	23	dot	точка
5416	23	politician	политик
5417	23	label	ярлык
5418	23	sunshine	солнечный свет
5419	23	ambition	цель
5420	23	folder	папка
5421	23	windshield	ветровое стекло
5422	23	toast	тост
5423	23	packet	пакет
5424	23	luxury	роскошь
5425	23	garbage	мусор
5426	23	ink	чернила
5427	23	herb	пряная или лекарственная трава
5428	23	fee	плата
5429	23	champagne	шампанское
5430	23	candidate	кандидат
5431	23	alcohol	алкоголь
5432	23	throat	горло
5433	23	chest	грудь
5434	23	crop	урожай
5435	23	bride	невеста
5436	23	sum	сумма
5437	23	signature	подпись
5438	23	backpack	рюкзак
5439	23	industry	промышленность
5440	23	interval	интервал
5441	23	grade	оценка
5442	23	pan	кастрюля
5443	23	identification	идентификация
5444	23	illness	болезнь
5445	23	countryside	сельская местность
5446	23	bee	пчела
5447	23	olive	оливка
5448	23	rose	роза
5449	23	antique	антиквариат
5450	23	baker	пекарь
5451	23	lecture	лекция
5452	23	frog	лягушка
5453	23	translation	перевод
5454	23	laptop	ноутбук
5455	23	embassy	посольство
5456	23	election	выборы
5457	23	beef	говядина
5458	23	golf	гольф
5459	23	bin	корзина
5460	23	poetry	поэзия
5461	23	kitten	котёнок
5462	23	profession	профессия
5463	23	madam	мадам
5464	23	review	обзор
5465	23	cattle	крупный рогатый скот
5466	23	announcement	объявление
5467	23	charity	благотворительность
5468	23	mall	торговый центр
5469	23	application	заявление
5470	23	contest	конкурс
5471	23	puppy	щенок
5472	23	ad	рекламное объявление
5473	23	calf	телёнок
5474	23	champion	чемпион
5475	23	northwest	северо-запад
5476	23	fare	плата за проезд
5477	23	necklace	ожерелье
5478	23	lamb	ягнёнок
5479	23	bracelet	браслет
5480	23	wheelchair	инвалидная коляска
5481	23	bulb	лампочка
5482	23	employer	работодатель
5483	23	creature	существо
5484	23	entertainment	развлечение
5485	23	pupil	ученик
5486	23	discount	скидка
5487	23	sunrise	восход солнца
5488	23	quantity	количество
5489	23	server	официант
5490	23	competition	соперничество
5491	23	angel	ангел
5492	23	racket	ракетка
5493	23	oven	духовка
5494	23	baggage	багаж
5495	23	drama	драма
5496	23	minimum	минимум
5497	23	foreigner	иностранец
5498	23	butcher	мясник
5499	23	clinic	клиника
5500	23	dolphin	дельфин
5501	23	occupation	оккупация
5502	23	worry	волнение
5504	23	ant	муравей
5505	23	pitcher	кувшин
5506	23	bacon	бекон
5507	23	basin	таз
5508	23	corn	кукуруза
5509	23	cathedral	собор
5510	23	musician	музыкант
5511	23	grocery	гастроном
5512	23	jug	кувшин
5513	23	hurricane	ураган
5514	23	reservation	бронирование
5515	23	kettle	чайник
5516	23	ache	боль
5517	23	midday	полдень
5518	23	ferry	паром
5519	23	southwest	юго-запад
5520	23	literature	литература
5521	23	northeast	северо-восток
5522	23	climate	климат
5523	23	tablet	таблетка
5524	23	resort	курорт
5525	23	trumpet	труба (муз.инструмент)
5526	23	festival	фестиваль
5527	23	circus	цирк
5528	23	improvement	улучшение
5529	23	loan	заем
5530	23	celebration	празднование
5531	23	debate	дебаты
5532	23	butterfly	бабочка
5533	23	transportation	транспорт
5534	23	earthquake	землетрясение
5535	23	diet	диета
5536	23	pub	пивная
5537	23	donkey	осёл
5538	23	sauce	соус
5539	23	admission	признание
5540	23	southeast	юго-восток
5541	23	clown	клоун
5542	23	diary	дневник
5543	23	physics	физика
5544	23	builder	строитель
5545	23	stripe	полоса
5546	23	waterfall	водопад
5547	23	dinosaur	динозавр
5548	23	independence	независимость
5549	23	diver	дайвер
5550	23	underwear	нижнее белье
5551	23	journalist	журналист
5552	23	invention	изобретение
5553	23	sneaker	кроссовка
5554	23	handwriting	почерк
5555	23	blogger	блогер
5556	23	salary	зарплата
5557	23	camel	верблюд
5558	23	headline	заголовок
5559	23	plug	штепсельная вилка
5560	23	dessert	десерт
5561	23	mosquito	комар
5562	23	monument	памятник
5563	23	wage	заработная плата
5564	23	receipt	квитанция
5565	23	diagram	диаграмма
5566	23	wardrobe	гардероб
5567	23	pedestrian	пешеход
5568	23	instructor	преподаватель
5569	23	parcel	посылка
5570	23	vase	ваза
5571	23	employment	работа
5572	23	leisure	досуг
5573	23	achievement	достижение
5574	23	chef	шеф-повар
5575	23	architect	архитектор
5576	23	tear	слеза
5577	23	pork	свинина
5578	23	accommodation	условия проживания
5579	23	parrot	попугай
5580	23	surface	поверхность
5581	23	freezer	морозильная камера
5582	23	buyer	покупатель
5583	23	salesman	продавец
5584	23	password	пароль
5585	23	flute	флейта
5586	23	certificate	сертификат
5587	23	snack	перекус
5588	23	spice	пряность
5589	23	architecture	архитектура
5590	23	firework	фейерверк
5591	23	whale	кит
5592	23	sculpture	скульптура
5593	23	refreshment	освежение
5594	23	disadvantage	невыгодное положение
5595	23	nickname	прозвище
5596	23	sandal	сандал
5597	23	bat	летучая мышь
5598	23	jelly	желе
5599	23	designer	дизайнер
5600	23	shark	акула
5601	23	goat	коза
5602	23	romance	роман
5603	23	canteen	столовая
5604	23	celebrity	знаменитость
5605	23	favourite	фаворит
5606	23	fly	муха
5607	23	cut	порез
5608	23	hit	удар
5609	23	drop	капля
5610	23	defeat	поражение
5611	23	public	общественность
5612	23	customs	таможня
5613	23	crisp	хрустящий картофель
5614	23	initial	инициал
5615	23	roll	рулон
5616	23	cruise	круиз
5617	23	dislike	неприязнь
5618	23	principal	принципал
5619	23	ride	поездка
5620	23	deposit	депозит
5621	23	fair	ярмарка
5622	23	comic	комик
5623	23	travel	путешествие
5624	23	jump	прыжок
5625	23	push	толчок
5626	23	finish	финиш
5627	23	aim	цель
5628	23	shout	вскрик
5629	23	hurry	спешка
5630	23	climb	восхождение
5631	23	hug	объятие
5632	23	cough	кашель
5633	23	maximum	максимум
5634	23	tense	время глагола
5635	23	lorry	грузовик
5636	23	scenery	пейзаж
5637	23	tap	стук
5638	23	flour	мука
5639	23	peach	персик
5640	23	recording	запись
5641	23	paragraph	пункт
5642	23	user	пользователь
5643	23	turkey	индейка
5644	23	swimmer	пловец
5645	23	congratulation	поздравление
5646	23	chemistry	химия
5647	23	recipe	рецепт
5648	23	salon	салон
5649	23	diving	прыжки в воду
5650	23	logo	логотип
5651	23	rubbish	мусор
5652	23	crossing	переход
5653	23	examiner	экзаменатор
5654	23	shake	покачивание
5655	23	climbing	альпинизм
5656	23	currency	валюта
5657	23	mathematics	математика
5658	23	honeymoon	медовый месяц
5659	23	singing	пение
5660	23	presentation	презентация
5661	23	comedy	комедия
5662	23	supporter	сторонник
5663	23	biology	биология
5664	23	essay	сочинение
5665	23	cost	стоимость
5666	23	registration	регистрация
5667	23	salmon	лосось
5668	23	correction	коррекция
5669	23	accountant	бухгалтер
5670	23	airline	авиакомпания
5671	23	composition	композиция
5672	23	teaching	преподавание
5673	23	vet	ветеринар
5674	23	trend	тенденция
5675	23	bomb	бомба
5676	23	forecast	прогноз
5677	23	bone	кость
5678	23	murder	преднамеренное убийство
5679	23	touch	прикосновение
5680	23	brief	сводка
5681	23	stay	пребывание
5682	23	exhibition	выставка
5683	23	barber	мужской парикмахер
5684	23	softness	мягкость
5685	23	ending	окончание
5686	23	cabbage	капуста
5687	23	bathtub	ванна
5688	23	ingredient	ингредиент
5689	23	souvenir	сувенир
5690	23	aeroplane	самолет
5691	23	peanut	арахис
5692	23	playground	детская площадка
5693	23	grill	гриль
5694	23	sweatshirt	свитшот
5695	23	orchestra	оркестр
5696	23	thunderstorm	гроза
5697	23	garlic	чеснок
5698	23	violin	скрипка
5699	23	shrimp	креветка
5700	23	fortnight	две недели
5701	23	geography	география
5702	23	advertisement	реклама
5703	23	queue	очередь
5704	23	grandparent	бабушка или дедушка
5705	23	lottery	лотерея
5706	23	pea	горошина
5707	23	campsite	кемпинг
5708	23	drugstore	аптека
5709	23	athlete	атлет
5710	23	graduate	выпускник
5711	23	ballet	балет
5712	23	arms	оружие
5713	23	membership	членство
5714	23	prescription	рецепт
5715	23	tournament	турнир
5716	23	smoking	курение
5717	23	cereal	злак
5718	23	competitor	конкурент
5719	23	graduation	градуировка
5720	23	workout	физическая тренировка
5721	23	app	программное приложение
5722	23	unemployment	безработица
5723	23	need	необходимость
5724	23	seller	продавец
5725	23	microwave	микроволновка
5726	23	biography	биография
5727	23	heating	нагрев
5728	23	windscreen	лобовое стекло
5729	23	coconut	кокос
5730	23	tuna	тунец
5731	23	immigration	иммиграция
5732	23	snowboard	сноуборд
5733	23	hostel	недорогая гостиница
5734	23	checkout	выписка из отеля
5735	23	qualification	квалификация
5736	23	performer	исполнитель
5737	23	petrol	бензин
5738	23	beginner	начинающий
5739	23	economics	экономика
5740	23	haircut	стрижка
5741	23	advert	объявление
5742	23	windsurfing	виндсерфинг
5743	23	flu	грипп
5744	23	faucet	водопроводный кран
5745	23	pollution	загрязнения окружающей среды
5746	23	relaxation	расслабление
5747	23	boxing	бокс
5748	23	cleaner	уборщик
5749	23	anniversary	годовщина
5750	23	barman	бармен
5751	23	tourism	туризм
5752	23	takeaway	еда на вынос
5753	23	lettuce	салат-латук
5754	23	check-in	регистрация
5755	23	try	попытка
5756	23	takeout	еда навынос
5757	23	championship	чемпионат
5758	23	firefighter	пожарный
5759	23	dishwasher	посудомоечная машина
5760	23	pharmacy	аптека
5761	23	comma	запятая
5762	23	pullover	свитер
5763	23	washing	стирка
5764	23	groceries	продовольственные товары
5765	23	farming	фермерство
5766	23	download	загрузка данных
5767	23	hairdresser	парикмахер
5768	23	housework	работа по дому
5769	23	hairdryer	фен
5770	23	calculator	калькулятор
5771	23	refund	возврат денег
5772	23	ironing	утюжка
5773	23	thriller	триллер
5774	23	printing	печать
5775	23	dustbin	мусорный бак
5776	23	fitness	физическая форма
5777	23	booking	бронирование
5778	23	popcorn	попкорн
5779	23	vegetarian	вегетарианец
5780	23	swimsuit	купальник
5781	23	gymnastics	гимнастика
5782	23	athletics	легкая атлетика
5783	23	semester	семестр
5784	23	pronunciation	произношение
5785	23	babysitter	няня для ребенка
5786	23	duvet	стеганое одеяло
5787	23	quiz	викторина
5788	23	mix	смесь
5789	23	tracksuit	спортивный костюм
5790	23	jumper	джемпер
5791	23	rugby	регби
5792	23	maths	математика
5793	23	nightclub	ночной клуб
5794	23	postman	почтальон
5795	23	signpost	дорожный указатель
5796	23	salesperson	продавец
5797	23	hurt	обида
5798	23	recycling	повторное использование
5799	23	spinach	шпинат
5800	24	rumour	слух
5801	24	shot	выстрел
5802	24	strength	сила
5803	24	cell	клетка
5804	24	commander	командир
5805	24	evidence	свидетельство
5806	24	presence	присутствие
5807	24	risk	риск
5808	24	vision	видение
5809	24	wrist	запястье
5810	24	relief	облегчение
5811	24	muscle	мышца
5812	24	servant	слуга
5813	24	gentleman	джентльмен
5814	24	target	цель
5815	24	mission	миссия
5816	24	manner	манера
5817	24	bullet	пуля
5818	24	pack	пакет
5819	24	steel	сталь
5820	24	rope	веревка
5821	24	tail	хвост
5822	24	threat	угроза
5823	24	jaw	челюсть
5824	24	pressure	давление
5825	24	dawn	рассвет
5826	24	heaven	небеса
5827	24	mass	масса
5828	24	slave	раб
5829	24	response	ответ
5830	24	making	изготовление
5831	24	clothing	одежда
5832	24	data	данные
5833	24	fighting	бой
5834	24	task	задание
5835	24	companion	компаньон
5836	24	eyebrow	бровь
5837	24	council	консилиум
5838	24	source	источник
5839	24	pace	темп
5840	24	intelligence	интеллект
5841	24	authority	полномочие
5842	24	beam	луч
5843	24	hood	капюшон
5844	24	reaction	реакция
5845	24	witness	свидетель
5846	24	mask	маска
5847	24	devil	черт
5848	24	tale	рассказ
5849	24	safety	безопасность
5850	24	loss	потеря
5851	24	emotion	эмоция
5852	24	arrow	стрелка
5853	24	terror	ужас
5854	24	victim	жертва
5855	24	motion	движение
5856	24	paw	лапа
5857	24	feature	особенность
5858	24	horror	ужас
5859	24	passage	проход
5860	24	empire	империя
5861	24	shell	оболочка
5862	24	harm	вред
5863	24	wire	провод
5864	24	mist	туман
5865	24	sake	благо
5866	24	rage	ярость
5867	24	standard	стандарт
5868	24	balance	равновесие
5869	24	device	устройство
5870	24	reality	реальность
5871	24	circumstance	обстоятельство
5872	24	slope	склон
5873	24	cloth	ткань
5874	24	structure	строение
5875	24	nerve	нерв
5876	24	gear	снаряжение
5877	24	client	клиент
5878	24	pride	гордость
5879	24	code	код
5880	24	statement	заявление
5881	24	joy	радость
5882	24	bush	куст
5883	24	mud	грязь
5884	24	hip	бедро
5885	24	theory	теория
5886	24	trial	судебное разбирательство
5887	24	waist	талия
5888	24	panic	паника
5889	24	lap	колени
5890	24	justice	справедливость
5891	24	impression	впечатление
5892	24	faith	вера
5893	24	fate	судьба
5894	24	suspicion	подозрение
5895	24	counter	прилавок
5896	24	rate	ставка
5897	24	freedom	свобода
5898	24	chaos	хаос
5899	24	warmth	тепло
5900	24	lane	переулок
5901	24	inspector	инспектор
5902	24	victory	победа
5903	24	investigation	расследование
5904	24	citizen	гражданин
5905	24	agreement	соглашение
5906	24	laser	лазер
5907	24	courage	смелость
5908	24	confidence	уверенность
5909	24	tray	лоток
5910	24	column	столбец
5911	24	hint	намек
5912	24	responsibility	ответственность
5913	24	tension	натяжение
5914	24	nation	страна
5915	24	estate	имущество
5916	24	craft	ремесло
5917	24	protection	защита
5918	24	confusion	замешательство
5919	24	curiosity	любопытство
5920	24	aircraft	самолет
5921	24	string	шнурок
5922	24	thigh	бедро
5923	24	fortune	удача
5924	24	impact	влияние
5925	24	proof	доказательство
5926	24	gesture	жест
5927	24	existence	существование
5928	24	torch	факел
5929	24	rib	ребро
5930	24	intention	намерение
5931	24	stock	акции
5932	24	species	биологический вид
5933	24	cart	телега
5934	24	flashlight	фонарик
5935	24	lung	легкое
5936	24	failure	неудача
5937	24	motor	двигатель
5938	24	clerk	клерк
5939	24	brick	кирпич
5940	24	oak	дуб
5941	24	bench	скамейка
5942	24	explosion	взрыв
5943	24	needle	игла
5944	24	charm	шарм
5945	24	fox	лиса
5946	24	drug	лекарство
5947	24	horn	гудок
5948	24	gut	кишка
5949	24	kingdom	царство
5950	24	helmet	шлем
5951	24	storey	этаж
5952	24	escape	побег
6068	24	network	сеть
5953	24	alien	чужестранец
5954	24	male	мужчина
5955	24	supply	припасы
5956	24	female	женщина
5957	24	glance	быстрый взгляд
5958	24	desire	желание
5959	24	worth	ценность
5960	24	trace	след
5961	24	concern	беспокойство
5962	24	claim	претензия
5963	24	blame	вина
5964	24	individual	личность
5965	24	young	молодежь
5966	24	strike	забастовка
5967	24	high	максимум
5968	24	current	ток
5969	24	evil	зло
5970	24	fix	решение
5971	24	scare	паника
5972	24	will	воля
5973	24	share	доля
5974	24	pole	полюс
5975	24	wound	рана
5976	24	flash	вспышка
5977	24	mention	упоминание
5978	24	violence	насилие
5979	24	root	корень
5980	24	darling	любимец
5981	24	treasure	сокровище
5982	24	grief	горе
5983	24	handful	пригоршня
5984	24	incident	инцидент
5985	24	regret	сожаление
5986	24	barrier	барьер
5987	24	galaxy	галактика
5988	24	grip	хватка
5989	24	idiot	идиот
5990	24	governor	губернатор
5991	24	stand	стенд
5992	24	county	округ
5993	24	minister	министр
5994	24	nail	ноготь
5995	24	gang	банда
5996	24	round	раунд
5997	24	ray	луч
5998	24	host	хозяин
5999	24	shelter	убежище
6000	24	lid	крышка
6001	24	sensation	ощущение
6002	24	suspect	подозреваемое лицо
6003	24	satisfaction	удовлетворение
6004	24	master	мастер
6005	24	sack	мешок
6006	24	disaster	бедствие
6007	24	whisky	виски
6008	24	suicide	самоубийство
6009	24	patience	терпение
6010	24	moonlight	лунный свет
6011	24	tide	волна
6012	24	rocket	ракета
6013	24	monitor	монитор
6014	24	guilt	вина
6015	24	civilisation	цивилизация
6016	24	element	элемент
6017	24	destruction	разрушение
6018	24	funeral	похороны
6019	24	resource	ресурс
6020	24	delight	восторг
6021	24	lobby	вестибюль
6022	24	tribe	племя
6023	24	community	сообщество
6024	24	package	пакет
6025	24	measure	мера
6026	24	advance	продвижение
6027	24	amusement	развлечение
6028	24	reputation	репутация
6029	24	ward	больничная палата
6030	24	territory	территория
6031	24	concrete	бетон
6032	24	diamond	алмаз
6033	24	version	версия
6034	24	interior	внутреннее пространство
6035	24	despair	отчаяние
6036	24	miracle	чудо
6037	24	identity	личность
6038	24	approach	подход
6039	24	wait	ожидание
6040	24	satellite	спутник
6041	24	daylight	дневной свет
6042	24	legend	легенда
6043	24	colony	колония
6044	24	injury	травма
6045	24	temper	характер
6046	24	curve	кривая
6047	24	stool	табурет
6048	24	possession	владение
6049	24	spread	распространение
6050	24	bond	связь
6051	24	core	ядро
6052	24	press	пресса
6053	24	wisdom	мудрость
6054	24	copper	медь
6055	24	belief	вера
6056	24	observation	наблюдение
6057	24	layer	слой
6058	24	motive	мотив
6059	24	rebel	повстанец
6060	24	jewel	драгоценный камень
6061	24	nest	гнездо
6062	24	hammer	молоток
6063	24	remark	замечание
6064	24	pine	сосна
6065	24	weakness	слабость
6066	24	reflection	отражение
6067	24	fragment	фрагмент
6069	24	symbol	символ
6070	24	whisper	шепот
6071	24	passion	страсть
6072	24	deck	палуба
6073	24	eagle	орел
6074	24	rush	прилив
6075	24	illusion	иллюзия
6076	24	setting	настройка
6077	24	revenge	месть
6078	24	function	функция
6079	24	discovery	открытие
6080	24	consciousness	сознание
6081	24	factor	фактор
6082	24	basement	подвал
6083	24	sympathy	соболезнование
6084	24	soil	почва
6085	24	loyalty	верность
6086	24	consequence	последствие
6087	24	trap	ловушка
6088	24	absence	отсутствие
6089	24	construction	строительство
6090	24	shooting	убийство или ранение выстрелом
6091	24	receiver	приемник
6092	24	terminal	терминал
6093	24	treatment	лечение
6094	24	poison	яд
6095	24	scale	масштаб
6096	24	nut	орех
6097	24	personality	личность
6098	24	steam	пар
6099	24	shift	смена
6100	24	procedure	процедура
6101	24	reference	ссылка
6102	24	feather	перо
6103	24	circuit	часто посещаемое место
6104	24	beat	ритм
6105	24	compound	соединение
6106	24	low	низкий уровень
6107	24	lifetime	продолжительность жизни
6108	24	nostril	ноздря
6109	24	nonsense	бессмыслица
6110	24	frustration	разочарование
6111	24	extreme	крайность
6112	24	voyage	путешествие
6113	24	scheme	схема
6114	24	ancestor	предок
6115	24	survivor	оставшийся в живых
6116	24	prospect	перспектива
6117	24	bite	кусок
6118	24	aspect	аспект
6119	24	seed	семя
6120	24	wealth	богатство
6121	24	profit	прибыль
6122	24	astonishment	изумление
6123	24	shed	сарай
6124	24	survival	выживание
6125	24	yacht	яхта
6126	24	meantime	тем временем
6127	24	combination	сочетание
6128	24	reach	досягаемость
6129	24	fantasy	фантазия
6130	24	living	средства на жизнь
6131	24	operator	оператор
6132	24	tradition	традиция
6133	24	household	домохозяйство
6134	24	quiet	тишина
6135	24	debt	долг
6136	24	approval	одобрение
6137	24	storage	хранение
6138	24	jury	жюри
6139	24	hunting	охота
6140	24	chart	диаграмма
6141	24	container	контейнер
6142	24	error	ошибка
6143	24	punishment	наказание
6144	24	outfit	наряд
6145	24	privacy	уединение
6146	24	lord	лорд
6147	24	concept	концепция
6148	24	anxiety	беспокойство
6149	24	mayor	мэр
6150	24	sample	образец
6151	24	crisis	кризис
6152	24	release	освобождение
6153	24	reserve	заповедник
6154	24	policy	политика
6155	24	expense	расход
6156	24	cast	актерский состав
6157	24	courtesy	любезность
6158	24	concentration	сосредоточенность
6159	24	basis	основание
6160	24	plot	сюжет
6161	24	opponent	противник
6162	24	cellar	подвал
6163	24	lens	объектив
6164	24	division	разделение
6165	24	struggle	борьба
6166	24	wrong	неправильность
6167	24	invasion	вторжение
6168	24	insult	оскорбление
6169	24	portion	часть
6170	24	widow	вдова
6171	24	owl	сова
6172	24	assistance	помощь
6173	24	insurance	страхование
6174	24	committee	комитет
6175	24	feed	корм
6176	24	amazement	изумление
6177	24	alternative	альтернатива
6178	24	enthusiasm	энтузиазм
6179	24	variety	разнообразие
6180	24	oxygen	кислород
6181	24	conflict	конфликт
6182	24	arch	арка
6183	24	appeal	обращение
6184	24	gain	усиление
6185	24	offence	преступление
6186	24	strategy	стратегия
6187	24	flow	поток
6188	24	sweat	пот
6189	24	terrorist	террорист
6190	24	tomb	гробница
6191	24	rhythm	ритм
6192	24	consideration	рассмотрение
6193	24	profile	профиль
6194	24	coincidence	случайное стечение обстоятельств
6195	24	ambassador	посол
6196	24	media	СМИ (средства массовой информации)
6197	24	alert	сигнал тревоги
6198	24	analysis	анализ
6199	24	means	способ
6200	24	blade	лезвие
6201	24	chief	шеф
6202	24	skateboarding	катание на скейтборде
6203	24	worm	червь
6204	24	growth	рост
6205	24	exception	исключение
6206	24	pond	пруд
6207	24	catch	улов
6208	24	terrace	терраса
6209	24	ton	тонна
6210	24	chase	погоня
6211	24	examination	экзамен
6212	24	substance	вещество
6213	24	misery	страдание
6214	24	capacity	мощность
6215	24	bandage	повязка
6216	24	affection	привязанность
6217	24	liar	лжец
6218	24	hook	крючок
6219	24	eyelid	веко
6220	24	mankind	человечество
6221	24	portrait	портрет
6222	24	determination	определение
6223	24	corporation	корпорация
6224	24	coward	трус
6225	24	revolution	революция
6226	24	troop	отряд
6227	24	certainty	уверенность
6228	24	phase	фаза
6229	24	gossip	сплетня
6230	24	kindness	доброжелательность
6231	24	swallow	глоток
6232	24	skeleton	скелет
6233	24	exhaustion	истощение
6234	24	deer	олень
6235	24	association	ассоциация
6236	24	tragedy	трагедия
6237	24	opening	отверстие
6238	24	discipline	дисциплина
6239	24	production	производство
6240	24	outline	очертание
6241	24	microphone	микрофон
6242	24	payment	платёж
6243	24	priority	приоритет
6244	24	objection	возражение
6245	24	badge	значок
6246	24	extent	степень
6247	24	comparison	сравнение
6248	24	quarrel	ссора
6249	24	liberty	свобода
6250	24	stroke	ход
6251	24	embarrassment	смущение
6252	24	maintenance	техническое обслуживание
6253	24	cure	лекарство
6254	24	fingernail	ноготь
6255	24	hedge	живая изгородь
6256	24	sadness	грусть
6257	24	origin	происхождение
6258	24	guarantee	гарантия
6259	24	sword	меч
6260	24	inside	внутренняя сторона
6261	24	darkness	темнота
6262	24	crew	экипаж
6263	24	snowboarding	сноубординг
6264	24	collocation	расположение
6265	24	feel	ощущение
6266	24	script	сценарий
6267	24	costume	костюм
6268	24	commission	комиссия
6269	24	investigator	следователь
6270	24	disguise	маскировка
6271	24	punch	пунш
6272	24	arrest	арест
6273	24	mixture	смесь
6274	24	surroundings	окружение
6275	24	surgery	хирургия
6276	24	admiration	восхищение
6277	24	editor	редактор
6278	24	gulf	пропасть
6279	24	institute	институт
6280	24	dealer	дилер
6281	24	resident	постоянный житель
6282	24	backup	резервная копия
6283	24	finding	находка
6284	24	cabin	каюта
6285	24	nerves	нервы
6286	24	defender	защитник
6287	24	strain	напряжение
6288	24	fisherman	рыбак
6289	24	volunteer	волонтёр
6290	24	creation	создание
6291	24	cycle	цикл
6292	24	depression	депрессия
6293	24	replacement	замена
6294	24	hold	трюм
6295	24	sickness	болезнь
6296	24	tan	загар
6297	24	chairman	председатель
6298	24	crack	трещина
6299	24	majority	большинство
6300	24	affair	дело
6301	24	suffering	страдание
6302	24	cooperation	сотрудничество
6303	24	philosophy	философия
6304	24	frequency	частота
6305	24	whistle	свисток
6306	24	conspiracy	заговор
6307	24	confession	признание
6308	24	calculation	вычисление
6309	24	cemetery	кладбище
6310	24	bartender	бармен
6311	24	encounter	столкновение
6312	24	landing	площадка
6313	24	perfect	совершенство
6314	24	cherry	вишня
6315	24	tag	ярлык
6316	24	behalf	действие от лица кого-то
6317	24	obligation	обязательство
6318	24	management	руководство
6319	24	acid	кислота
6320	24	split	раскол
6321	24	proposal	предложение
6322	24	theft	кража
6323	24	investment	инвестиция
6324	24	introduction	введение
6325	24	pause	пауза
6326	24	expectation	ожидание
6327	24	refugee	беженец
6328	24	parade	парад
6329	24	specialist	специалист
6330	24	fat	жир
6331	24	era	эра
6332	24	contrast	контраст
6333	24	razor	бритва
6334	24	disappearance	исчезновение
6335	24	temptation	искушение
6336	24	loaf	буханка
6337	24	spray	спрей
6338	24	napkin	салфетка
6339	24	icon	икона
6340	24	mechanic	механик
6341	24	recovery	восстановление
6342	24	dimension	измерение
6343	24	rise	подъем
6344	24	gardener	садовник
6345	24	dose	доза
6346	24	laundry	прачечная
6347	24	harmony	согласие
6348	24	myth	миф
6349	24	scratch	царапина
6350	24	publicity	публичность
6351	24	characteristic	характеристика
6352	24	paperwork	канцелярская работа
6353	24	cue	кий
6354	24	income	доход
6355	24	economy	экономика
6356	24	chimney	дымоход
6357	24	berry	ягода
6358	24	bomber	бомбардировщик
6359	24	swan	лебедь
6360	24	frost	мороз
6361	24	pitch	тональность звука
6362	24	verse	стих
6363	24	inhabitant	житель
6364	24	rape	изнасилование
6365	24	hearing	слух
6366	24	extension	продление
6367	24	telescope	телескоп
6368	24	dialogue	диалог
6369	24	bruise	синяк
6370	24	interruption	прерывание
6371	24	envy	зависть
6372	24	transfer	перевод
6373	24	dive	погружение
6374	24	negotiation	переговоры
6375	24	guidance	наставление
6376	24	capture	захват
6377	24	maker	производитель
6378	24	hire	прокат
6379	24	medal	медаль
6380	24	robbery	ограбление
6381	24	fold	складка
6382	24	confirmation	подтверждение
6383	24	contrary	что-то противоположное
6384	24	volcano	вулкан
6385	24	cardboard	картон
6386	24	regulation	регулирование
6387	24	scandal	скандал
6388	24	atom	атом
6389	24	evolution	эволюция
6390	24	adjustment	регулировка
6391	24	campus	кампус
6392	24	efficiency	эффективность
6393	24	symptom	симптом
6394	24	institution	учреждение
6395	24	penalty	штраф
6396	24	catalogue	каталог
6397	24	aluminium	алюминий
6398	24	misunderstanding	недоразумение
6399	24	bombing	бомбежка
6400	24	understanding	понимание
6401	24	timing	выбор времени
6402	24	planning	планирование
6403	24	lighting	освещение
6404	24	trading	торговля
6405	24	gambling	азартная игра
6406	24	reporting	отчетность
6407	24	nursing	профессия медсестры
6408	24	warming	согревание
6409	24	belongings	вещи
6410	24	banking	банковское дело
6411	24	learning	обучение
6412	24	clip	зажим
6413	24	mortgage	ипотека
6414	24	harvest	сбор урожая
6415	24	visa	виза
6416	24	promotion	продвижение
6417	24	attic	чердак
6418	24	demonstration	демонстрация
6419	24	budget	бюджет
6420	24	wasp	оса
6421	24	motorcycle	мотоцикл
6422	24	requirement	требование
6423	24	pro	спортсмен-профессионал
6424	24	marker	метка
6425	24	therapy	терапия
6426	24	honesty	честность
6427	24	eagerness	рвение
6428	24	episode	эпизод
6429	24	bonus	бонус
6430	24	crab	краб
6431	24	spectator	зритель
6432	24	electronics	электроника
6433	24	thirst	жажда
6434	24	gum	десна
6435	24	collector	коллекционер
6436	24	nuisance	неприятность
6437	24	infection	инфекция
6438	24	disposal	удаление
6439	24	selection	выбор
6440	24	gasoline	бензин
6441	24	convenience	удобство
6442	24	appreciation	признательность
6443	24	receptionist	администратор
6444	24	exploration	исследование
6445	24	theme	тема
6446	24	cruelty	жестокость
6447	24	banker	банкир
6448	24	variation	изменение
6449	24	commitment	обязательство
6450	24	inspiration	вдохновение
6451	24	database	база данных
6452	24	mineral	минерал
6453	24	finance	финансы
6454	24	definition	определение
6455	24	liver	печень
6456	24	emphasis	особое внимание
6457	24	retirement	отставка
6458	24	psychology	психология
6459	24	assessment	оценка
6460	24	carbon	углерод
6461	24	encouragement	поддержка
6462	24	litter	мусор
6463	24	distinction	различие
6464	24	hell	ад
6465	24	triangle	треугольник
6466	24	compromise	компромисс
6467	24	diplomat	дипломат
6468	24	publisher	издатель
6469	24	nursery	детский сад
6470	24	edition	издание
6471	24	pint	пинта (GB 0,57 л) (US 0,473 л)
6472	24	syllable	слог
6473	24	involvement	участие
6474	24	producer	производитель
6475	24	obsession	одержимость
6476	24	navigation	навигация
6477	24	decoration	украшение
6478	24	query	вопрос
6479	24	input	входные данные
6480	24	criticism	критика
6481	24	expertise	компетентность
6482	24	prejudice	предубеждение
6483	24	recommendation	рекомендация
6484	24	researcher	исследователь
6485	24	landlord	домовладелец
6486	24	leopard	леопард
6487	24	context	контекст
6488	24	burglar	грабитель
6489	24	poverty	бедность
6490	24	fame	известность
6491	24	percentage	процент
6492	24	contribution	вклад
6493	24	philosopher	философ
6494	24	pedal	педаль
6495	24	breakdown	поломка
6496	24	bumper	бампер
6497	24	width	ширина
6498	24	accuracy	точность
6499	24	motivation	мотивация
6500	24	critic	критик
6501	24	wheat	пшеница
6502	24	faculty	факультет
6503	24	welfare	благосостояние
6504	24	category	категория
6505	24	disgrace	позор
6506	24	separation	отделение
6507	24	commerce	коммерция
6508	24	psychologist	психолог
6509	24	crocodile	крокодил
6510	24	substitute	замена
6511	24	suburb	пригород
6512	24	stadium	стадион
6513	24	tutor	репетитор
6514	24	parliament	парламент
6515	24	helper	помощник
6516	24	bun	булочка
6517	24	trophy	трофей
6518	24	gig	кабриолет
6519	24	shortage	нехватка
6520	24	daytime	дневное время
6521	24	similarity	сходство
6522	24	partnership	партнерство
6523	24	punk	панк
6524	24	democracy	демократия
6525	24	carnival	карнавал
6526	24	viewer	зритель
6527	24	deadline	крайний срок
6528	24	settler	поселенец
6529	24	preference	предпочтение
6530	24	cafeteria	кафетерий
6531	24	raincoat	дождевик
6532	24	enjoyment	наслаждение
6533	24	prediction	предсказание
6534	24	cracker	крекер (сухое печенье)
6535	24	trolley	тележка
6536	24	desktop	рабочий стол
6537	24	attachment	привязанность
6538	24	generosity	щедрость
6539	24	eyelash	ресница
6540	24	politeness	вежливость
6541	24	stepfather	отчим
6542	24	remedy	лекарственное средство
6543	24	seeker	самонаводящийся снаряд
6544	24	mint	мята
6545	24	parachute	парашют
6546	24	dilemma	дилемма
6547	24	publication	публикация
6548	24	rehearsal	репетиция
6549	24	minority	меньшинство
6550	24	expansion	расширение
6551	24	conductor	дирижер
6552	24	immigrant	иммигрант
6553	24	pudding	пудинг
6554	24	summary	резюме
6555	24	crossroad	перекресток
6556	24	bravery	храбрость
6557	24	greatness	величие
6558	24	pension	пенсия
6559	24	denim	джинсовая ткань
6560	24	disagreement	разногласие
6561	24	statistic	статистика
6562	24	choir	хор
6563	24	pancake	блин
6564	24	measurement	измерение
6565	24	pottery	керамика
6566	24	thesis	диссертация
6567	24	bracket	кронштейн
6568	24	analyst	аналитик
6569	24	recreation	отдых
6570	24	greenhouse	теплица
6571	24	consultant	консультант
6572	24	breakthrough	крупное достижение
6573	24	bakery	пекарня
6574	24	chemist	аптекарь
6575	24	stepmother	мачеха
6576	24	lifestyle	образ жизни
6577	24	tornado	торнадо
6578	24	manufacturer	производитель
6579	24	burglary	кража со взломом
6580	24	escalator	эскалатор
6581	24	willingness	готовность
6582	24	animation	анимация
6583	24	tablecloth	скатерть
6584	24	unhappiness	несчастье
6585	24	zipper	застежка-молния
6586	24	info	информация
6587	24	fossil	окаменелость
6588	24	landlady	домовладелица
6589	24	novelist	писатель-романист
6590	24	wildlife	дикая природа
6591	24	tightness	теснота
6592	24	addict	наркоман
6593	24	terms	условия
6594	24	burn	ожог
6595	24	purchase	покупка
6596	24	slash	сокращение
6597	24	manners	манеры
6598	24	survey	опрос
6599	24	breed	порода
6600	24	leak	утечка
6601	24	conduct	поведение
6602	24	estimate	оценка
6603	24	bid	заявка
6604	24	conservative	консерватор
6605	24	increase	увеличение
6606	24	abuse	злоупотребление
6607	24	award	присуждение
6608	24	slide	слайд
6609	24	bend	изгиб
6610	24	stamp	штамп
6611	24	update	последние данные
6612	24	imperative	императив
6613	24	graphic	графика
6614	24	national	гражданин
6615	24	classic	классика
6616	24	collapse	крах
6617	24	swing	качели
6618	24	bang	взрыв
6619	24	splash	всплеск
6620	24	dash	тире
6621	24	broadcast	теле- или радиопередача
6622	24	extract	экстракт
6623	24	double	двойник
6624	24	brother-in-law	шурин
6625	24	scales	весы
6626	24	x-ray	рентгеновское излучение
6627	24	mother-in-law	теща
6628	24	sister-in-law	невестка
6629	24	father-in-law	свекор
6630	24	son-in-law	зять
6631	24	facilities	возможности
6632	24	globalisation	глобализация
6633	24	donation	пожертвование
6634	24	vinegar	уксус
6635	24	click	щелчок
6636	24	graph	график
6637	24	mosque	мечеть
6638	24	eyesight	зрение
6639	24	shopkeeper	лавочник
6640	24	clause	пункт
6641	24	advertising	реклама
6642	24	saving	спасение
6643	24	friendliness	дружелюбие
6644	24	adoption	усыновление
6645	24	bikini	бикини
6646	24	addiction	наркомания
6647	24	gaming	азартная игра
6648	24	placement	размещение
6649	24	pop	хлопок
6650	24	boost	поддержка
6651	24	investor	инвестор
6652	24	equality	равенство
6653	24	upbringing	воспитание
6654	24	feedback	отзыв
6655	24	vitamin	витамин
6656	24	timetable	расписание
6657	24	tabloid	бульварная газета
6658	24	gardening	садоводство
6659	24	supplier	поставщик
6660	24	marathon	марафон
6661	24	gender	пол
6662	24	cursor	курсор
6663	24	export	экспорт
6664	24	terrorism	терроризм
6665	24	nutrient	питательное вещество
6666	24	offender	преступник
6667	24	self-confidence	уверенность в себе
6668	24	testing	тестирование
6669	24	photography	фотографирование
6670	24	reduction	сокращение
6671	24	thanks	благодарность
6672	24	lyric	текст песни
6673	24	toenail	ноготь на пальце ноги
6674	24	sponsor	спонсор
6675	24	inventor	изобретатель
6676	24	genetics	генетика
6677	24	artwork	художественное оформление
6678	24	venue	место встречи
6679	24	popularity	популярность
6680	24	agriculture	сельское хозяйство
6681	24	forum	форум
6682	24	seminar	семинар
6683	24	flexibility	гибкость
6684	24	tiredness	усталость
6685	24	manufacturing	производство
6686	24	consumer	потребитель
6687	24	bestseller	бестселлер
6688	24	marketing	маркетинг
6689	24	conservation	сохранение
6690	24	composer	композитор
6691	24	protester	протестующий
6692	24	participation	участие
6693	24	tsunami	цунами
6694	24	journalism	журналистика
6695	24	publishing	издательское дело
6696	24	badminton	бадминтон
6697	24	questionnaire	анкета
6698	24	hip-hop	хип хоп
6699	24	curriculum	учебная программа
6700	24	genre	жанр
6701	24	daughter-in-law	невестка
6702	24	smoker	курильщик
6703	24	ban	запрет
6704	24	disability	инвалидность
6705	24	highlight	основной момент
6706	24	dairy	молочные продукты
6707	24	cardigan	кардиган
6708	24	hours	график работы
6709	24	voting	голосование
6710	24	colon	двоеточие
6711	24	electrician	электрик
6712	24	thermometer	термометр
6713	24	screening	скрининг
6714	24	solo	соло
6715	24	presidency	президентство
6716	24	entrepreneur	предприниматель
6717	24	organiser	организатор
6718	24	plumber	водопроводчик
6719	24	remains	останки
6720	24	co-operation	сотрудничество
6721	24	programming	программирование
6722	24	creativity	креативность
6723	24	referee	судья
6724	24	dissatisfaction	недовольство
6725	24	zip	молния
6726	24	booklet	буклет
6727	24	applicant	претендент
6728	24	overtime	сверхурочная работа
6729	24	entertainer	конферансье
6730	24	catering	общественное питание
6731	24	comedian	комик
6732	24	inflation	инфляция
6733	24	zebra	зебра
6734	24	handout	милостыня
6735	24	lecturer	лектор
6736	24	downtown	деловая часть города
6737	24	laziness	лень
6738	24	leaflet	листовка
6739	24	pharmacist	фармацевт
6740	24	idiom	идиома
6741	24	learner	учащийся
6742	24	semifinal	полуфинал
6743	24	mathematician	математик
6744	24	tonne	тонна
6745	24	motorist	автомобилист
6746	24	economist	экономист
6747	24	recession	спад
6748	24	availability	наличие
6749	24	leek	порей
6750	24	upgrade	модернизация
6751	24	prevention	профилактика
6752	24	fluency	беглость
6753	24	soundtrack	саундтрек
6754	24	dishonesty	нечестность
6755	24	spreadsheet	электронная таблица
6756	24	browser	браузер
6757	24	bookmark	закладка
6758	24	cello	виолончель
6759	24	decrease	уменьшение
6760	24	racism	расизм
6761	24	debit	дебет
6762	24	aubergine	баклажан
6763	24	prawn	креветка
6764	24	stopover	остановка
6765	24	broadband	система
6766	24	prefix	приставка
6767	24	presenter	предъявитель
6768	24	zucchini	цукини (кабачок)
6769	24	apostrophe	апостроф
6770	24	suffix	суффикс
6771	24	hyphen	дефис
6772	24	semicolon	точка с запятой
6773	24	courgette	кабачок
7358	25	effectiveness	эффективность
7359	25	optimist	оптимист
7360	25	rhetoric	риторика
7361	25	takeover	захват
7362	25	accused	обвиняемый
7363	25	endeavour	старание
7364	25	retreat	отступление
7365	25	epidemic	эпидемия
7366	25	reign	царствование
7367	25	premises	помещение
7368	25	trek	путешествие
7369	25	variable	переменная
7370	25	import	импорт
7371	25	objective	цель
7372	25	peek	быстрый взгляд
7373	25	documentary	документальный фильм
7374	25	liberal	либерал
7375	25	crawl	кроль
7376	25	worse	то, что хуже
7377	25	reverse	задний ход
7378	25	provisions	провизия
7379	25	rich	богатые
7380	25	well-being	благополучие
7381	25	disclosure	раскрытие
7382	25	quota	квота
7383	25	turnover	оборот
7384	25	shortcoming	недостаток
7385	25	selfishness	эгоизм
7386	25	flair	способность
7387	25	excellence	превосходство
7388	25	rarity	редкость
7389	25	accumulation	накопление
7390	25	audit	аудит
7391	25	provider	поставщик
7392	25	transparency	прозрачность
7393	25	contention	конкуренция
7394	25	richness	богатство
7395	25	accordance	соответствие
7396	25	erosion	эрозия
7397	25	progression	развитие
7398	25	sovereignty	суверенитет
7399	25	insertion	вставка
7400	25	tenure	срок владения
7401	25	cheat	мошенник
7402	25	format	формат
7403	25	undergraduate	студент
7404	25	exclusion	исключение
7405	25	alignment	выравнивание
7406	25	jargon	жаргон
7407	25	retail	розничная торговля
7408	25	exploitation	эксплуатация
7409	25	collaboration	сотрудничество
7410	25	sexuality	сексуальность
7411	25	shareholder	акционер
7412	25	earnings	заработок
7413	25	rehabilitation	реабилитация
7414	25	digestion	пищеварение
7415	25	diversity	разнообразие
7416	25	tribunal	суд
7417	25	itinerary	путеводитель
7418	25	commentator	комментатор
7419	25	waffle	вафля
7420	25	audition	прослушивание
7421	25	duo	дуэт
7422	25	franchise	франшиза
7423	25	mainstream	основное направление
7424	25	discrimination	дискриминация
7425	25	guideline	указание
7426	25	solidarity	солидарность
7427	25	renovation	реконструкция
7428	25	relevance	уместность
7429	25	beneficiary	лицо
7430	25	reliability	надежность
7431	25	subscription	подписка
7432	25	genocide	геноцид
7433	25	endorsement	индоссамент
7434	25	substitution	замена
7435	25	insider	инсайдер
7436	25	activist	активист
7437	25	processing	обработка
7438	25	synthesis	синтез
7439	25	mandate	мандат
7440	25	correlation	соотношение
7441	25	redundancy	сокращение штатов
7442	25	activation	активация
7443	25	proceeds	выручка
7444	25	columnist	обозреватель
7445	25	stereotype	стереотип
7446	25	dissertation	диссертация
7447	25	emergence	появление
7448	25	enthusiast	энтузиаст
7449	25	contributor	жертвователь
7450	25	integration	интеграция
7451	25	autonomy	автономия
7452	25	cultivation	выращивание
7453	25	clarification	прояснение
7454	25	copyright	авторское право
7455	25	sewing	шитье
7456	25	tuition	обучение
7457	25	recruitment	вербовка
7458	25	cancellation	отмена
7459	25	contender	претендент
7460	25	listing	перечень
7461	25	subtitle	подзаголовок
7462	25	ranking	ранжирование
7463	25	moderation	умеренность
7464	25	turnout	забастовка
7465	25	hygiene	гигиена
7466	25	overview	обзор
7467	25	nutrition	питание
7468	25	teamwork	совместная работа
7469	25	debut	дебют
7470	25	governance	руководство
7471	25	workplace	рабочее место
7472	25	cholesterol	холестерин
7473	25	congestion	затор
7474	25	unwillingness	нежелание
7475	25	feminist	феминистка
7476	25	critique	критика
7477	25	fundraising	сбор средств
7478	25	decision-making	принятие решений
7479	25	generalisation	обобщение
7480	25	constituency	избирательный округ
7481	25	deficit	дефицит
7482	25	newsletter	информационный бюллетень
7483	25	federation	федерация
7484	25	deodorant	дезодорант
7485	25	soy	соя
7486	25	inclusion	включение
7487	25	sponsorship	спонсорство
7488	25	environmentalist	сторонник защиты окружающей среды
7489	25	spam	спам
7490	25	literacy	грамотность
7491	25	spokesperson	представитель
7492	25	misuse	злоупотребление
7493	25	subscriber	абонент
7494	25	incidence	падение
7495	25	productivity	производительность
7496	25	inaccuracy	неточность
7497	25	educator	воспитатель
7498	25	methodology	методика
7499	25	subsidy	субсидия
7500	25	nominee	кандидат
7501	25	tailpipe	выхлопная труба
7502	25	benchmark	отметка уровня
7503	25	cutback	сокращение
7504	25	extrovert	экстраверт
7505	25	suitability	пригодность
7506	25	obesity	ожирение
7507	25	industrialisation	индустриализация
7508	25	accountability	подотчетность
7509	25	techno	техно
7510	25	gerund	герундий
7511	25	readership	круг читателей
7512	25	prevalence	распространенность
7513	25	overdraft	превышение остатка счета
7514	25	privatisation	приватизация
7516	26	follower	последователь
7517	26	instinct	инстинкт
7518	26	conviction	убеждение
7519	26	mercy	пощада
7520	26	ritual	ритуал
7521	26	resistance	сопротивление
7522	26	intent	намерение
7523	26	civilian	гражданское лицо
7524	26	raid	рейд
7525	26	knuckle	костяшки пальцев
7526	26	scrap	крохи
7527	26	strand	прядь
7528	26	fireplace	камин
7529	26	prey	добыча
7530	26	sorrow	печаль
7531	26	heap	куча
7532	26	globe	глобус
7533	26	pursuit	погоня
7534	26	strap	ремешок
7535	26	lump	комок
7536	26	contempt	презрение
7537	26	bundle	пачка
7538	26	grain	зерно
7539	26	residence	резиденция
7540	26	weed	сорняк
7541	26	intensity	интенсивность
7542	26	ribbon	лента
7543	26	disgust	отвращение
7544	26	conscience	совесть
7545	26	counsel	адвокат
7546	26	timber	древесина
7547	26	hostage	заложник
7548	26	formation	образование
7549	26	dignity	достоинство
7550	26	plague	чума
7551	26	threshold	порог
7552	26	alliance	союз
7553	26	intruder	незваный гость
7554	26	dismay	смятение
7555	26	transmission	передача
7556	26	compliment	комплимент
7557	26	velvet	бархат
7558	26	recognition	признание
7559	26	assembly	собрание
7560	26	infant	младенец
7561	26	refuge	убежище
7562	26	awe	благоговение
7563	26	casualty	несчастный случай
7564	26	veteran	ветеран
7565	26	virtue	достоинство
7566	26	fraction	фракция
7567	26	goodness	доброта
7568	26	sequence	последовательность
7569	26	wreckage	обломки крушения
7570	26	irritation	раздражение
7571	26	venture	рискованная затея
7572	26	quest	поиски
7573	26	observer	наблюдатель
7574	26	desperation	отчаяние
7575	26	perception	восприятие
7576	26	irony	ирония
7577	26	revelation	откровение
7578	26	specimen	образец
7579	26	wilderness	дикая природы
7580	26	particle	частица
7581	26	ignorance	невежество
7582	26	custody	опека
7583	26	fringe	бахрома
7584	26	entity	объект
7585	26	province	провинция
7586	26	impatience	нетерпение
7587	26	resemblance	сходство
7588	26	virgin	девственница
7589	26	siren	сирена
7590	26	chapel	часовня
7591	26	local	местный житель
7592	26	cheer	одобрительный возглас
7593	26	strip	полоса
7594	26	gamble	азартная игра
7595	26	sip	глоток
7596	26	spiral	спираль
7597	26	grasp	хватка
7598	26	villager	сельский житель
7599	26	resentment	негодование
7600	26	prosecutor	прокурор
7601	26	treaty	международный договор
7602	26	counsellor	советник
7603	26	shovel	лопата
7604	26	stupidity	глупость
7605	26	stance	позиция
7606	26	worship	поклонение
7607	26	plea	просьба
7608	26	scenario	вариант развития событий
7609	26	memorial	мемориал
7610	26	momentum	импульс
7611	26	recruit	новобранец
7612	26	confrontation	конфронтация
7613	26	sentiment	сентиментальность
7614	26	hostility	враждебность
7615	26	vent	вентиляционное отверстие
7616	26	trio	трио
7617	26	burial	похороны
7618	26	resolution	резолюция
7619	26	reassurance	успокаивание
7620	26	recollection	воспоминание
7621	26	tranquillity	спокойствие
7622	26	slaughter	резня
7623	26	psychiatrist	психиатр
7624	26	urge	побуждение
7625	26	orphan	сирота
7626	26	descendant	потомок
7627	26	splendour	великолепие
7628	26	resignation	отставка
7629	26	trait	характерная черта
7630	26	vanity	тщеславие
7631	26	frontier	граница
7632	26	imitation	имитация
7633	26	outrage	возмущение
7634	26	doom	гибель
7635	26	deception	обман
7636	26	melody	мелодия
7637	26	leave	отпуск
7638	26	chancellor	канцлер
7639	26	complexion	цвет кожи
7640	26	denial	отрицание
7641	26	heritage	наследие
7642	26	margin	запас
7643	26	vicinity	близость
7644	26	discretion	усмотрение
7645	26	coral	коралл
7646	26	brink	край
7647	26	ordeal	жестокая пытка
7648	26	millennium	тысячелетие
7649	26	disposition	характер
7650	26	procession	процессия
7651	26	indifference	безразличие
7652	26	charcoal	древесный уголь
7653	26	hail	град
7654	26	catastrophe	катастрофа
7655	26	loft	чердак
7656	26	backing	поддержка
7657	26	fanatic	фанатик
7658	26	intuition	интуиция
7659	26	woodland	лесистая местность
7660	26	sibling	родной брат
7661	26	spotlight	прожектор
7662	26	fraud	мошенничество
7663	26	verdict	вердикт
7664	26	interpretation	толкование
7665	26	transition	переход
7666	26	tenant	арендатор
7667	26	forgiveness	прощение
7668	26	hang	вид
7669	26	parallel	параллель
7670	26	concession	уступка
7671	26	scan	сканирование
7672	26	stitch	стежок
7673	26	turmoil	смятение
7674	26	blackmail	шантаж
7675	26	whim	прихоть
7676	26	ornament	орнамент
7677	26	foul	нарушение правил игры
7678	26	predecessor	предшественник
7679	26	dialect	диалект
7680	26	tenderness	нежность
7681	26	trauma	травма
7682	26	lure	приманка
7683	26	indicator	индикатор
7684	26	inheritance	наследование
7685	26	withdrawal	изъятие
7686	26	kidney	почка
7687	26	tribute	дань
7688	26	massacre	резня
7689	26	integrity	целостность
7690	26	remorse	раскаяние
7691	26	coldness	холод
7692	26	intrusion	вторжение
7693	26	longing	страстное желание
7694	26	spade	лопата
7695	26	tractor	трактор
7696	26	prosecution	судебное преследование
7697	26	scrutiny	критическая оценка
7698	26	inclination	наклон
7699	26	quote	цитата
7700	26	offspring	потомство
7701	26	morale	моральное состояние
7702	26	invoice	счёт-фактура
7703	26	propaganda	пропаганда
7704	26	coup	удачный ход
7705	26	feat	подвиг
7706	26	drain	дренаж
7707	26	frenzy	неистовство
7708	26	medication	лекарство
7709	26	metaphor	метафора
7710	26	intellect	интеллект
7711	26	adolescent	подросток
7712	26	founder	основатель
7713	26	injection	инъекция
7714	26	fragrance	аромат
7715	26	vow	клятва
7716	26	legacy	наследие
7717	26	ethic	этика
7718	26	vice	порок
7719	26	dice	игра в кости
7720	26	reunion	воссоединение
7721	26	cricket	крикет
7722	26	complexity	сложность
7723	26	proximity	близость
7724	26	serenity	спокойствие
7725	26	medium	средство
7726	26	representation	представительство
7727	26	decay	распад
7728	26	rally	митинг
7729	26	sincerity	искренность
7730	26	endurance	выносливость
7731	26	conception	концепция
7732	26	lawsuit	судебный процесс
7733	26	tolerance	толерантность
7734	26	reproach	упрек
7735	26	circulation	циркуляция
7736	26	restriction	ограничение
7737	26	delegation	делегация
7738	26	hypothesis	гипотеза
7739	26	rejection	отказ
7740	26	wrinkle	морщина
7741	26	precedent	прецедент
7742	26	starvation	голод
7743	26	riches	богатство
7744	26	framework	рамки
7745	26	optimism	оптимизм
7746	26	persuasion	убеждение
7747	26	superiority	превосходство
7748	26	treat	угощение
7749	26	advocate	защитник
7750	26	repetition	повторение
7751	26	novelty	новизна
7752	26	contradiction	противоречие
7753	26	humility	смирение
7754	26	coastline	береговая линия
7755	26	paradox	парадокс
7756	26	suspense	неизвестность
7757	26	rash	сыпь
7758	26	vitality	жизнеспособность
7759	26	intervention	вмешательство
7760	26	transplant	саженец
7761	26	regime	режим
7762	26	conversion	переход
7763	26	resolve	решительность
7764	26	toddler	ребенок
7765	26	bet	пари
7766	26	consultation	консультация
7767	26	imprisonment	заключение
7768	26	hierarchy	иерархия
7769	26	diplomacy	дипломатия
7770	26	empathy	сочувствие
7771	26	willpower	сила воли
7772	26	thinker	мыслитель
7773	26	analogy	аналогия
7774	26	likelihood	вероятность
7775	26	provocation	провокация
7776	26	spouse	супруг
7777	26	bureaucracy	бюрократия
7778	26	stiffness	жесткость
7779	26	masterpiece	шедевр
7780	26	forgery	подделка
7781	26	justification	оправдание
7782	26	whereabouts	местонахождение
7783	26	mortality	смертность
7784	26	fulfilment	удовлетворенность достигнутым
7785	26	echo	эхо
7786	26	impossibility	невозможность
7787	26	diagnosis	диагноз
7788	26	undertaking	важное дело или проект
7789	26	ruling	постановление
7790	26	reasoning	ход мысли
7791	26	schooling	образование
7792	26	loathing	ненависть
7793	26	counselling	консультирование
7794	26	unrest	беспорядки
7795	26	taxpayer	налогоплательщик
7796	26	peer	ровня
7797	26	astronomy	астрономия
7798	26	filter	фильтр
7799	26	attribute	атрибут
7800	26	blister	волдырь
7801	26	relish	удовольствие
7802	26	output	выход
7803	26	glue	клей
7804	26	extremist	экстремист
7805	26	pact	договор
7806	26	necktie	галстук
7807	26	consensus	единодушие
7808	26	janitor	дворник
7809	26	outbreak	внезапное начало
7810	26	surplus	излишек
7811	26	donor	донор
7812	26	famine	голод
7813	26	quotation	цитата
7814	26	breadth	ширина
7815	26	monopoly	монополия
7816	26	retrospect	взгляд назад
7817	26	credibility	авторитетность
7818	26	voter	избиратель
7819	26	plight	бедственное положение
7820	26	stimulus	стимул
7821	26	socialism	социализм
7822	26	bias	предвзятость
7823	26	drought	засуха
7824	26	rivalry	соперничество
7825	26	incentive	стимул
7826	26	axle	ось
7827	26	capitalist	капиталист
7828	26	antibiotic	антибиотик
7829	26	stubbornness	упрямство
7830	26	dominance	господство
7831	26	nostalgia	ностальгия
7832	26	revival	возрождение
7833	26	snob	сноб
7834	26	constraint	ограничение
7835	26	reversal	полное изменение
7836	26	closure	закрытие
7837	26	tact	такт
7838	26	sensibility	чувствительность
7839	26	hypocrisy	лицемерие
7840	26	amendment	поправка
7841	26	expenditure	расход
7842	26	mishap	неудача
7843	26	premium	премия
7844	26	silverware	столовые приборы
7845	26	persistence	упорство
7846	26	vaccine	вакцина
7847	26	proverb	пословица
7848	26	flashback	ретроспекция
7849	26	sanction	санкция
7850	26	severity	строгость
7851	26	standpoint	точка зрения
7852	26	outset	начало
7853	26	implementation	реализация
7854	26	inhibition	торможение
7855	26	supplement	добавка
7856	26	practitioner	практик
7857	26	ambiguity	двусмысленность
7858	26	bribery	взяточничество
7859	26	deprivation	лишение
7860	26	cheerfulness	бодрость
7861	26	classification	классификация
7862	26	insecurity	ненадежность
7863	26	racist	расист
7864	26	pastime	времяпровождение
7865	26	continuity	неизменность
7866	26	validity	обоснованность
7867	26	infancy	младенчество
7868	26	elimination	устранение
7869	26	vandalism	вандализм
7870	26	aspiration	стремление
7871	26	cutlery	столовые приборы
7872	26	individuality	индивидуальность
7873	26	toughness	прочность
7874	26	lifespan	продолжительность жизни
7875	26	legislation	законодательство
7876	26	charisma	харизма
7877	26	vocation	призвание
7878	26	openness	открытость
7879	26	insomnia	бессонница
7880	26	reliance	опора
7881	26	suit	судебный иск
7882	26	longevity	долголетие
7883	26	normality	нормальность
7884	26	influx	наплыв
7885	26	capitalism	капитализм
7886	26	negligence	халатность
7887	26	merger	слияние
7888	26	inferiority	более низкое положение
7889	26	deterrent	средство устрашения
7890	26	protagonist	главный герой
7891	26	allocation	распределение
7892	26	resilience	упругость
7893	26	narrative	рассказ
7894	26	reform	реформа
7895	26	gasp	вздох
7896	26	lumber	пиломатериалы
7897	26	crush	давка
7898	26	read	чтение
7899	26	produce	продукция
7900	26	intellectual	интеллектуал
7901	26	slap	шлепок
7902	26	self-respect	самоуважение
7903	26	dependence	зависимость
7904	26	self-assurance	уверенность в себе
7905	26	narrator	рассказчик
7906	26	sufferer	страдалец
7907	26	muddle	путаница
7908	26	polish	полироль
7909	26	diarrhoea	понос
7910	26	perseverance	настойчивость
7911	26	overload	перегрузка
7912	26	trilogy	трилогия
7913	26	paradigm	парадигма
7914	26	coherence	согласованность
7915	26	scarcity	дефицит
7916	26	divide	разделение
7917	26	upkeep	содержание
7918	26	vaccination	вакцинация
7919	26	workforce	трудовые ресурсы
7920	26	intolerance	нетерпимость
7921	26	synonym	синоним
7922	26	contraceptive	противозачаточное средство
7923	26	referendum	референдум
7924	26	retailer	розничный продавец
7925	26	mediocrity	посредственность
7926	26	spending	расходы
7927	26	materialism	материализм
7928	26	xenophobia	ксенофобия
7929	26	misinterpretation	неверное истолкование
7930	26	retention	сохранение
7931	26	inequality	неравенство
7932	26	clap	хлопок
7933	26	syllabus	программа
7934	26	introvert	интроверт
7935	26	workaholic	трудоголик
7936	26	latest	новинка
7937	26	contraception	предупреждение беременности
7938	26	simplification	упрощение
7939	26	crackdown	крутые меры
7940	26	homelessness	бездомность
7941	26	oilfield	нефтяное месторождение
7942	26	sustainability	устойчивость
7943	26	talks	переговоры
\.


--
-- Name: decks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daniilgrecin
--

SELECT pg_catalog.setval('public.decks_id_seq', 26, true);


--
-- Name: levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daniilgrecin
--

SELECT pg_catalog.setval('public.levels_id_seq', 1, false);


--
-- Name: user_word_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daniilgrecin
--

SELECT pg_catalog.setval('public.user_word_stats_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daniilgrecin
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daniilgrecin
--

SELECT pg_catalog.setval('public.words_id_seq', 7943, true);


--
-- Name: decks decks_pkey; Type: CONSTRAINT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.decks
    ADD CONSTRAINT decks_pkey PRIMARY KEY (id);


--
-- Name: levels levels_level_name_key; Type: CONSTRAINT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_level_name_key UNIQUE (level_name);


--
-- Name: levels levels_pkey; Type: CONSTRAINT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);


--
-- Name: user_word_stats user_word_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.user_word_stats
    ADD CONSTRAINT user_word_stats_pkey PRIMARY KEY (id);


--
-- Name: user_word_stats user_word_stats_user_id_word_id_key; Type: CONSTRAINT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.user_word_stats
    ADD CONSTRAINT user_word_stats_user_id_word_id_key UNIQUE (user_id, word_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_telegram_id_key; Type: CONSTRAINT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_telegram_id_key UNIQUE (telegram_id);


--
-- Name: words words_pkey; Type: CONSTRAINT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT words_pkey PRIMARY KEY (id);


--
-- Name: decks decks_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.decks
    ADD CONSTRAINT decks_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: user_word_stats user_word_stats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.user_word_stats
    ADD CONSTRAINT user_word_stats_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_word_stats user_word_stats_word_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.user_word_stats
    ADD CONSTRAINT user_word_stats_word_id_fkey FOREIGN KEY (word_id) REFERENCES public.words(id) ON DELETE CASCADE;


--
-- Name: words words_deck_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: daniilgrecin
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT words_deck_id_fkey FOREIGN KEY (deck_id) REFERENCES public.decks(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 7isiWuWFybOSOXRD17lImoaXGQ4aASX0IqWh7XICo93pO2RMXMljBtHUX36M2hj

