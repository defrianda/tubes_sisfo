SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `Sisfo`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounting_period`
--

CREATE TABLE IF NOT EXISTS `accounting_period` (
  `ACCTG_PERIOD_ID` int(11) NOT NULL,
  `ACCTG_PERIOD_NUMBER` varchar(45) NOT NULL,
  `FROM_DATE` date DEFAULT NULL,
  `THRU_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accounting_transaction`
--

CREATE TABLE IF NOT EXISTS `accounting_transaction` (
  `ID_TRANS` varchar(20) NOT NULL,
  `TRANSACTION_DATE` varchar(45) DEFAULT NULL,
  `ENTRY_DATE` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `general_ledger_account`
--

CREATE TABLE IF NOT EXISTS `general_ledger_account` (
  `GL_ACCOUNT_ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ogl_account`
--

CREATE TABLE IF NOT EXISTS `ogl_account` (
  `OGL_ACCOUNT_ID` int(11) NOT NULL,
  `GL_ACCOUNT_ID` int(11) NOT NULL,
  `FROM_DATE` date DEFAULT NULL,
  `THRU_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ogl_account_balance`
--

CREATE TABLE IF NOT EXISTS `ogl_account_balance` (
  `TRANS_DETAIL_SEQ_ID` int(11) NOT NULL,
  `ACCTG_PERIOD_ID` varchar(45) NOT NULL,
  `OGL_ACCOUNT_ID` varchar(45) NOT NULL,
  `AMOUNT` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE IF NOT EXISTS `transaction_detail` (
`TRANS_DETAIL_SEQ_ID` int(11) NOT NULL,
  `AMOUNT` double DEFAULT NULL,
  `DEBIT_CREDIT_FLAG` varchar(1) DEFAULT NULL,
  `ID_TRANS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounting_period`
--
ALTER TABLE `accounting_period`
 ADD PRIMARY KEY (`ACCTG_PERIOD_ID`), ADD UNIQUE KEY `ACCTG_PERIOD_NUMBER_UNIQUE` (`ACCTG_PERIOD_NUMBER`);

--
-- Indexes for table `accounting_transaction`
--
ALTER TABLE `accounting_transaction`
 ADD PRIMARY KEY (`ID_TRANS`);

--
-- Indexes for table `general_ledger_account`
--
ALTER TABLE `general_ledger_account`
 ADD PRIMARY KEY (`GL_ACCOUNT_ID`);

--
-- Indexes for table `ogl_account`
--
ALTER TABLE `ogl_account`
 ADD PRIMARY KEY (`OGL_ACCOUNT_ID`), ADD UNIQUE KEY `GL_ACCOUNT_ID_UNIQUE` (`GL_ACCOUNT_ID`);

--
-- Indexes for table `ogl_account_balance`
--
ALTER TABLE `ogl_account_balance`
 ADD UNIQUE KEY `TRANS_DETAIL_SEQ_ID_UNIQUE` (`TRANS_DETAIL_SEQ_ID`), ADD UNIQUE KEY `ACCTG_PERIOD_ID_UNIQUE` (`ACCTG_PERIOD_ID`), ADD UNIQUE KEY `GL_ACCOUNT_ID_UNIQUE` (`OGL_ACCOUNT_ID`);

--
-- Indexes for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
 ADD UNIQUE KEY `TRANS_DETAIL_SEQ_ID_UNIQUE` (`TRANS_DETAIL_SEQ_ID`), ADD UNIQUE KEY `ID_TRANS_UNIQUE` (`ID_TRANS`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
MODIFY `TRANS_DETAIL_SEQ_ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
