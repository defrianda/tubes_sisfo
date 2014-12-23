SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_akuntan`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounting_transaction`
--

CREATE TABLE IF NOT EXISTS `accounting_transaction` (
  `ID_TRANS` varchar(20) NOT NULL,
  `TRANSACTION_DATE` date DEFAULT NULL,
  `ENTRY_DATE` date DEFAULT NULL,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounting_transaction`
--

INSERT INTO `accounting_transaction` (`ID_TRANS`, `TRANSACTION_DATE`, `ENTRY_DATE`, `DESCRIPTION`) VALUES
('T1', '2014-09-01', '2014-09-02', 'Menanam Modal'),
('T2', '2014-09-02', '2014-09-02', 'Beli Supply'),
('T3', '2014-09-03', '2014-09-03', 'Account Receivable'),
('T4', '2014-09-04', '2014-09-04', 'Account Payable');

-- --------------------------------------------------------

--
-- Table structure for table `gl_account`
--

CREATE TABLE IF NOT EXISTS `gl_account` (
  `GL_ACCOUNT_ID` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`GL_ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gl_account`
--

INSERT INTO `gl_account` (`GL_ACCOUNT_ID`, `DESCRIPTION`) VALUES
('1001', 'Cash'),
('1004', 'Supply'),
('3001', 'Modal Patel');

-- --------------------------------------------------------

--
-- Table structure for table `gl_type`
--

CREATE TABLE IF NOT EXISTS `gl_type` (
  `ID_TYPE` int(11) NOT NULL,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gl_type`
--

INSERT INTO `gl_type` (`ID_TYPE`, `DESCRIPTION`) VALUES
(1, 'Asset'),
(2, 'Liability'),
(3, 'Equity'),
(4, 'Expense'),
(5, 'Revenue');

-- --------------------------------------------------------

--
-- Table structure for table `ogl_account_balance`
--

CREATE TABLE IF NOT EXISTS `ogl_account_balance` (
  `ID_OGL_ACCOUNT_BALANCE` varchar(45) NOT NULL,
  `AMOUNT` double DEFAULT NULL,
  `GL_ACCOUNT_ID` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_OGL_ACCOUNT_BALANCE`),
  UNIQUE KEY `TRANS_DETAIL_SEQ_ID_UNIQUE` (`ID_OGL_ACCOUNT_BALANCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ogl_account_balance`
--

INSERT INTO `ogl_account_balance` (`ID_OGL_ACCOUNT_BALANCE`, `AMOUNT`, `GL_ACCOUNT_ID`) VALUES
('03A1', 10000, '1001'),
('03A2', 10000, '3001'),
('03A3', 1577, '1004'),
('03A4', 8423, '1001'),
('03A5', 12923, '1001'),
('03A6', 14500, '3001');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE IF NOT EXISTS `transaction_detail` (
  `TRANS_DETAIL_SEQ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_TRANS` varchar(20) NOT NULL,
  `ID_OGL_ACCOUNT_BALANCE` varchar(45) NOT NULL,
  `AMOUNT` double DEFAULT NULL,
  `DEBIT_CREDIT_FLAG` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`TRANS_DETAIL_SEQ_ID`),
  UNIQUE KEY `TRANS_DETAIL_SEQ_ID_UNIQUE` (`TRANS_DETAIL_SEQ_ID`),
  UNIQUE KEY `ID_OGL_ACCOUNT_BALANCE_UNIQUE` (`ID_OGL_ACCOUNT_BALANCE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `transaction_detail`
--

INSERT INTO `transaction_detail` (`TRANS_DETAIL_SEQ_ID`, `ID_TRANS`, `ID_OGL_ACCOUNT_BALANCE`, `AMOUNT`, `DEBIT_CREDIT_FLAG`) VALUES
(1, 'T1', '03A1', 10000, 'D'),
(2, 'T1', '03A2', 10000, 'C'),
(3, 'T2', '03A3', 1577, 'D'),
(4, 'T2', '03A4', 1577, 'C'),
(5, 'T3', '03A5', 4500, 'D'),
(6, 'T3', '03A6', 4500, 'C');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
