-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 29 2022 г., 14:47
-- Версия сервера: 10.4.18-MariaDB
-- Версия PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `computers`
--

-- --------------------------------------------------------

--
-- Структура таблицы `computer`
--

CREATE TABLE `computer` (
  `ID_Computer` int(11) NOT NULL,
  `netname` varchar(50) DEFAULT NULL,
  `motherboard` varchar(50) DEFAULT NULL,
  `RAM_Capacity` int(11) DEFAULT NULL,
  `HDD_Capacity` int(11) DEFAULT NULL,
  `monitor` varchar(50) DEFAULT NULL,
  `vendor` varchar(50) DEFAULT NULL,
  `guarantee` datetime DEFAULT NULL,
  `FID_processor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `computer`
--

INSERT INTO `computer` (`ID_Computer`, `netname`, `motherboard`, `RAM_Capacity`, `HDD_Capacity`, `monitor`, `vendor`, `guarantee`, `FID_processor`) VALUES
(1, 'RakPC', 'msi mb', 8, 300, 'samsung lx1', 'dell', '2002-01-19 03:14:07', 2),
(2, 'KekPc', 'msi mb', 12, 1200, 'lenovo lx23', 'asus', '2022-03-19 00:00:07', 5),
(3, 'ClownPc', 'gigabyte b450', 3, 140, 'sony x3', 'dell', '2032-03-19 00:00:00', 1),
(4, 'LocalPc', 'asus b450', 16, 800, 'philips xn25266', 'MegaPC', '2222-04-19 00:00:00', 3),
(5, 'OfficePc', 'asus b250', 13, 600, 'viewsonic', 'OmegaPC', '2015-06-20 00:00:00', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `computer_software`
--

CREATE TABLE `computer_software` (
  `FID_Computer` int(11) NOT NULL,
  `FID_Software` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `computer_software`
--

INSERT INTO `computer_software` (`FID_Computer`, `FID_Software`) VALUES
(4, 4),
(1, 2),
(2, 4),
(3, 5),
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `processors`
--

CREATE TABLE `processors` (
  `ID_Processor` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `processors`
--

INSERT INTO `processors` (`ID_Processor`, `NAME`, `frequency`) VALUES
(1, 'ryzen 9 5900x', 5200),
(2, 'intel 486', 10),
(3, 'amd fx ', 8000),
(4, 'intel core i69 ', 420),
(5, 'intel i7 9750h', 2600);

-- --------------------------------------------------------

--
-- Структура таблицы `software`
--

CREATE TABLE `software` (
  `ID_software` int(11) NOT NULL,
  `NAME` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `software`
--

INSERT INTO `software` (`ID_software`, `NAME`) VALUES
(1, 'nano'),
(2, 'windows'),
(3, 'Xampp'),
(4, 'minecraft'),
(5, 'firefox');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `computer`
--
ALTER TABLE `computer`
  ADD PRIMARY KEY (`ID_Computer`),
  ADD KEY `FID_processor` (`FID_processor`);

--
-- Индексы таблицы `computer_software`
--
ALTER TABLE `computer_software`
  ADD KEY `FID_Computer` (`FID_Computer`),
  ADD KEY `FID_Software` (`FID_Software`);

--
-- Индексы таблицы `processors`
--
ALTER TABLE `processors`
  ADD PRIMARY KEY (`ID_Processor`);

--
-- Индексы таблицы `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`ID_software`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `processors`
--
ALTER TABLE `processors`
  MODIFY `ID_Processor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `software`
--
ALTER TABLE `software`
  MODIFY `ID_software` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `computer`
--
ALTER TABLE `computer`
  ADD CONSTRAINT `computer_ibfk_1` FOREIGN KEY (`FID_processor`) REFERENCES `processors` (`ID_Processor`);

--
-- Ограничения внешнего ключа таблицы `computer_software`
--
ALTER TABLE `computer_software`
  ADD CONSTRAINT `computer_software_ibfk_1` FOREIGN KEY (`FID_Computer`) REFERENCES `computer` (`ID_Computer`),
  ADD CONSTRAINT `computer_software_ibfk_2` FOREIGN KEY (`FID_Software`) REFERENCES `software` (`ID_software`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
