-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 04, 2020 at 12:44 PM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ewayiuax_bark`
--

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` int(11) NOT NULL,
  `form_name` varchar(255) NOT NULL,
  `form_content` text NOT NULL,
  `service_id` int(11) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `questions_json` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `form_name`, `form_content`, `service_id`, `country_code`, `questions_json`) VALUES
(23, 'debt', '{\n    \"display\": \"wizard\",\n    \"components\": [\n        {\n            \"title\": \"Page 1\",\n            \"label\": \"Page 1\",\n            \"type\": \"panel\",\n            \"key\": \"page1\",\n            \"components\": [\n                {\n                    \"label\": \"HTML\",\n                    \"tag\": \"h4\",\n                    \"attrs\": [\n                        {\n                            \"attr\": \"\",\n                            \"value\": \"\"\n                        }\n                    ],\n                    \"content\": \"Who is seeking to recover the debt?\",\n                    \"refreshOnChange\": false,\n                    \"tableView\": false,\n                    \"key\": \"html1\",\n                    \"type\": \"htmlelement\",\n                    \"input\": false\n                },\n                {\n                    \"label\": \"Who is seeking to recover the debt?\",\n                    \"labelPosition\": \"left-right\",\n                    \"optionsLabelPosition\": \"right\",\n                    \"inline\": false,\n                    \"hideLabel\": true,\n                    \"tableView\": false,\n                    \"values\": [\n                        {\n                            \"label\": \"An individual\",\n                            \"value\": \"An Individual\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"A business\",\n                            \"value\": \"A Business\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"Other\",\n                            \"value\": \"other\",\n                            \"shortcut\": \"\"\n                        }\n                    ],\n                    \"key\": \"whoIsSeekingToRecoverTheDebt\",\n                    \"type\": \"radio\",\n                    \"labelWidth\": 50,\n                    \"input\": true\n                },\n                {\n                    \"label\": \"otherdata\",\n                    \"hideLabel\": true,\n                    \"tableView\": true,\n                    \"key\": \"textField\",\n                    \"conditional\": {\n                        \"show\": true,\n                        \"when\": \"whoIsSeekingToRecoverTheDebt\",\n                        \"eq\": \"other\"\n                    },\n                    \"type\": \"textfield\",\n                    \"input\": true\n                }\n            ],\n            \"input\": false,\n            \"tableView\": false,\n            \"breadcrumb\": \"none\",\n            \"buttonSettings\": {\n                \"previous\": true,\n                \"cancel\": false,\n                \"next\": true\n            },\n            \"collapsible\": false,\n            \"breadcrumbClickable\": true\n        },\n        {\n            \"title\": \"Page 2\",\n            \"label\": \"Page 2\",\n            \"type\": \"panel\",\n            \"key\": \"page2\",\n            \"input\": false,\n            \"tableView\": false,\n            \"components\": [\n                {\n                    \"label\": \"HTML\",\n                    \"tag\": \"h4\",\n                    \"attrs\": [\n                        {\n                            \"attr\": \"\",\n                            \"value\": \"\"\n                        }\n                    ],\n                    \"content\": \"What is the amount owed?\",\n                    \"refreshOnChange\": false,\n                    \"tableView\": false,\n                    \"key\": \"html\",\n                    \"type\": \"htmlelement\",\n                    \"input\": false\n                },\n                {\n                    \"label\": \"What is the amount owed?\",\n                    \"labelPosition\": \"left-right\",\n                    \"optionsLabelPosition\": \"right\",\n                    \"inline\": false,\n                    \"hideLabel\": true,\n                    \"tableView\": false,\n                    \"values\": [\n                        {\n                            \"label\": \"up to £500\",\n                            \"value\": \"up to  £500\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"£500 - £1k\",\n                            \"value\": \"£500 - £1k\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"£1k - £5k\",\n                            \"value\": \"£1k - £5k\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"£5k - £10k\",\n                            \"value\": \"£5k - £10k\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"More than £10k\",\n                            \"value\": \"More than £10k\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"Other\",\n                            \"value\": \"other\",\n                            \"shortcut\": \"\"\n                        }\n                    ],\n                    \"key\": \"whatIsTheAmountOwed\",\n                    \"type\": \"radio\",\n                    \"labelWidth\": 50,\n                    \"input\": true\n                },\n                {\n                    \"label\": \"otherdata\",\n                    \"hideLabel\": true,\n                    \"tableView\": true,\n                    \"key\": \"otherdata\",\n                    \"conditional\": {\n                        \"show\": true,\n                        \"when\": \"whatIsTheAmountOwed\",\n                        \"eq\": \"other\"\n                    },\n                    \"type\": \"textfield\",\n                    \"input\": true\n                }\n            ],\n            \"breadcrumb\": \"none\",\n            \"buttonSettings\": {\n                \"previous\": true,\n                \"cancel\": false,\n                \"next\": true\n            },\n            \"collapsible\": false\n        },\n        {\n            \"title\": \"Page 3\",\n            \"label\": \"Page 3\",\n            \"type\": \"panel\",\n            \"key\": \"page3\",\n            \"components\": [\n                {\n                    \"label\": \"HTML\",\n                    \"tag\": \"h4\",\n                    \"attrs\": [\n                        {\n                            \"attr\": \"\",\n                            \"value\": \"\"\n                        }\n                    ],\n                    \"content\": \"How long has this amount been unpaid for?\",\n                    \"refreshOnChange\": false,\n                    \"tableView\": false,\n                    \"key\": \"html2\",\n                    \"type\": \"htmlelement\",\n                    \"input\": false\n                },\n                {\n                    \"label\": \"How long has this amount been unpaid for?\",\n                    \"labelPosition\": \"left-right\",\n                    \"optionsLabelPosition\": \"right\",\n                    \"inline\": false,\n                    \"hideLabel\": true,\n                    \"tableView\": false,\n                    \"values\": [\n                        {\n                            \"label\": \"Less than a month\",\n                            \"value\": \"Less than a month\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"1 - 3 months\",\n                            \"value\": \"1 - 3 months\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"3 - 6 months\",\n                            \"value\": \"3 - 6 months\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"6 - 12 months\",\n                            \"value\": \"6 - 12 months\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"6 - 12 months\",\n                            \"value\": \"6 - 12 months\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"Other\",\n                            \"value\": \"other\",\n                            \"shortcut\": \"\"\n                        }\n                    ],\n                    \"key\": \"howLongHasThisAmountBeenUnpaidFor\",\n                    \"type\": \"radio\",\n                    \"labelWidth\": 50,\n                    \"input\": true\n                },\n                {\n                    \"label\": \"otherdata\",\n                    \"hideLabel\": true,\n                    \"tableView\": true,\n                    \"key\": \"otherdata1\",\n                    \"conditional\": {\n                        \"show\": true,\n                        \"when\": \"howLongHasThisAmountBeenUnpaidFor\",\n                        \"eq\": \"other\"\n                    },\n                    \"type\": \"textfield\",\n                    \"input\": true\n                }\n            ],\n            \"input\": false,\n            \"tableView\": false,\n            \"breadcrumb\": \"none\",\n            \"buttonSettings\": {\n                \"previous\": true,\n                \"cancel\": false,\n                \"next\": true\n            },\n            \"collapsible\": false\n        },\n        {\n            \"title\": \"Page 4\",\n            \"label\": \"Page 4\",\n            \"type\": \"panel\",\n            \"key\": \"page4\",\n            \"components\": [\n                {\n                    \"label\": \"HTML\",\n                    \"tag\": \"h4\",\n                    \"attrs\": [\n                        {\n                            \"attr\": \"\",\n                            \"value\": \"\"\n                        }\n                    ],\n                    \"content\": \"Do you already have a court judgement for this debt?\",\n                    \"refreshOnChange\": false,\n                    \"tableView\": false,\n                    \"key\": \"html4\",\n                    \"type\": \"htmlelement\",\n                    \"input\": false\n                },\n                {\n                    \"label\": \"Do you already have a court judgement for this debt?\",\n                    \"labelPosition\": \"left-right\",\n                    \"optionsLabelPosition\": \"right\",\n                    \"inline\": false,\n                    \"hideLabel\": true,\n                    \"tableView\": false,\n                    \"values\": [\n                        {\n                            \"label\": \"Yes\",\n                            \"value\": \"Yes\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"No - I would like help to obtain one\",\n                            \"value\": \"No - I would like help to obtain one\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"No - but I don\'t need help to obtain one\",\n                            \"value\": \"No - but I don\'t need help to obtain one\",\n                            \"shortcut\": \"\"\n                        },\n                        {\n                            \"label\": \"Other\",\n                            \"value\": \"other\",\n                            \"shortcut\": \"\"\n                        }\n                    ],\n                    \"key\": \"doYouAlreadyHaveACourtJudgementForThisDebt\",\n                    \"type\": \"radio\",\n                    \"labelWidth\": 50,\n                    \"input\": true\n                },\n                {\n                    \"label\": \"otherdata\",\n                    \"hideLabel\": true,\n                    \"tableView\": true,\n                    \"key\": \"otherdata2\",\n                    \"conditional\": {\n                        \"show\": true,\n                        \"when\": \"doYouAlreadyHaveACourtJudgementForThisDebt\",\n                        \"eq\": \"other\"\n                    },\n                    \"type\": \"textfield\",\n                    \"input\": true\n                }\n            ],\n            \"input\": false,\n            \"tableView\": false,\n            \"breadcrumb\": \"none\",\n            \"buttonSettings\": {\n                \"previous\": true,\n                \"cancel\": false,\n                \"next\": true\n            },\n            \"collapsible\": false\n        },\n        {\n            \"title\": \"Page 5\",\n            \"label\": \"Page 5\",\n            \"type\": \"panel\",\n            \"key\": \"page5\",\n            \"components\": [\n                {\n                    \"label\": \"HTML\",\n                    \"tag\": \"h4\",\n                    \"attrs\": [\n                        {\n                            \"attr\": \"\",\n                            \"value\": \"\"\n                        }\n                    ],\n                    \"content\": \"Which of the following does the debt relate to?\",\n                    \"refreshOnChange\": false,\n                    \"tableView\": false,\n                    \"key\": \"html3\",\n                    \"type\": \"htmlelement\",\n                    \"input\": false\n                },\n                {\n                    \"label\": \"Commercial dispute\",\n                    \"tableView\": false,\n                    \"defaultValue\": false,\n                    \"key\": \"whichOfTheFollowingDoesTheDebtRelateTo\",\n                    \"type\": \"checkbox\",\n                    \"input\": true\n                },\n                {\n                    \"label\": \"Loan not repaid\",\n                    \"tableView\": false,\n                    \"key\": \"loanNotRepaid\",\n                    \"type\": \"checkbox\",\n                    \"input\": true,\n                    \"defaultValue\": false\n                },\n                {\n                    \"label\": \"Unpaid invoice(s)\",\n                    \"tableView\": false,\n                    \"key\": \"unpaidInvoiceS\",\n                    \"type\": \"checkbox\",\n                    \"input\": true,\n                    \"defaultValue\": false\n                },\n                {\n                    \"label\": \"Service/product provided not of agreed standard\",\n                    \"tableView\": false,\n                    \"key\": \"serviceProductProvidedNotOfAgreedStandard\",\n                    \"type\": \"checkbox\",\n                    \"input\": true,\n                    \"defaultValue\": false\n                },\n                {\n                    \"label\": \"Unpaid rent\",\n                    \"tableView\": false,\n                    \"key\": \"unpaidRent\",\n                    \"type\": \"checkbox\",\n                    \"input\": true,\n                    \"defaultValue\": false\n                },\n                {\n                    \"label\": \"Other\",\n                    \"tableView\": false,\n                    \"key\": \"other\",\n                    \"type\": \"checkbox\",\n                    \"input\": true,\n                    \"defaultValue\": false\n                },\n                {\n                    \"label\": \"otherdata\",\n                    \"hideLabel\": true,\n                    \"tableView\": true,\n                    \"key\": \"otherdata3\",\n                    \"conditional\": {\n                        \"show\": true,\n                        \"when\": \"other\",\n                        \"eq\": \"0\"\n                    },\n                    \"type\": \"textfield\",\n                    \"input\": true\n                }\n            ],\n            \"input\": false,\n            \"tableView\": false,\n            \"breadcrumb\": \"none\",\n            \"buttonSettings\": {\n                \"previous\": true,\n                \"cancel\": false,\n                \"next\": true\n            },\n            \"collapsible\": false\n        },\n        {\n            \"title\": \"Page 6\",\n            \"label\": \"Page 6\",\n            \"type\": \"panel\",\n            \"key\": \"page6\",\n            \"components\": [\n                {\n                    \"label\": \"HTML\",\n                    \"attrs\": [\n                        {\n                            \"attr\": \"style\",\n                            \"value\": \"background-color: #40CB89; box-shadow: 0 7px 12px 0 rgba(0,0,0,0.1); height: 7.750em; width: 7.750em;margin-left:33%;border-radius:50%;\"\n                        }\n                    ],\n                    \"content\": \"<div id=\\\"bark-question-6\\\" class=\\\"bark-modal-question\\\"><div class=\\\"new-project-container\\\" id=\\\"inline-bark-question\\\"><div class=\\\"center\\\"><div class=\\\"d-flex success-circle align-items-center justify-content-center rounded-circle mx-auto mt-6 mb-4\\\" aria-hidden=\\\"true\\\"><i style=\\\"color:white;position:absolute;top:40px;left:190px;font-size:35px\\\" class=\\\"fa fa-check\\\"></i></i><img src=\\\"http://www.bark.com/img/barkv2/custom-icons/modal-success-tick.png\\\" alt=\\\"\\\" width=\\\"51\\\" height=\\\"40\\\"></div><h4 class=\\\"mb-3 px-3 px-sm-4 lh-md\\\">Great - we\'ve got pros ready and available.</h4></div></div></div>\",\n                    \"refreshOnChange\": false,\n                    \"tableView\": false,\n                    \"key\": \"html5\",\n                    \"type\": \"htmlelement\",\n                    \"input\": false\n                }\n            ],\n            \"input\": false,\n            \"tableView\": false,\n            \"breadcrumb\": \"none\",\n            \"buttonSettings\": {\n                \"previous\": true,\n                \"cancel\": false,\n                \"next\": true\n            },\n            \"collapsible\": false,\n            \"breadcrumbClickable\": true\n        },\n        {\n            \"title\": \"Page 7\",\n            \"label\": \"Page 7\",\n            \"type\": \"panel\",\n            \"key\": \"page7\",\n            \"components\": [\n                {\n                    \"label\": \"HTML\",\n                    \"tag\": \"h4\",\n                    \"attrs\": [\n                        {\n                            \"attr\": \"\",\n                            \"value\": \"\"\n                        }\n                    ],\n                    \"content\": \"What email address would you like quotes sent to?\",\n                    \"refreshOnChange\": false,\n                    \"tableView\": false,\n                    \"key\": \"html6\",\n                    \"type\": \"htmlelement\",\n                    \"input\": false\n                },\n                {\n                    \"label\": \"Email\",\n                    \"tableView\": true,\n                    \"validate\": {\n                        \"required\": true,\n                        \"unique\": true\n                    },\n                    \"unique\": true,\n                    \"key\": \"email\",\n                    \"type\": \"email\",\n                    \"input\": true\n                },\n                {\n                    \"label\": \"I am happy to receive occasional marketing emails from Bark\",\n                    \"tableView\": false,\n                    \"key\": \"iAmHappyToReceiveOccasionalMarketingEmailsFromBark\",\n                    \"type\": \"checkbox\",\n                    \"input\": true,\n                    \"defaultValue\": false\n                }\n            ],\n            \"input\": false,\n            \"tableView\": false,\n            \"breadcrumb\": \"none\",\n            \"buttonSettings\": {\n                \"previous\": true,\n                \"cancel\": false,\n                \"next\": true\n            },\n            \"collapsible\": false\n        },\n        {\n            \"title\": \"Page 8\",\n            \"label\": \"Page 8\",\n            \"type\": \"panel\",\n            \"key\": \"page8\",\n            \"components\": [\n                {\n                    \"label\": \"HTML\",\n                    \"tag\": \"h4\",\n                    \"attrs\": [\n                        {\n                            \"attr\": \"\",\n                            \"value\": \"\"\n                        }\n                    ],\n                    \"content\": \"What is your phone number?\",\n                    \"refreshOnChange\": false,\n                    \"tableView\": false,\n                    \"key\": \"html7\",\n                    \"type\": \"htmlelement\",\n                    \"input\": false\n                },\n                {\n                    \"label\": \"Phone Number\",\n                    \"tableView\": true,\n                    \"validate\": {\n                        \"required\": true\n                    },\n                    \"key\": \"phoneNumber\",\n                    \"type\": \"phoneNumber\",\n                    \"input\": true\n                },\n                {\n                    \"label\": \"HTML\",\n                    \"attrs\": [\n                        {\n                            \"attr\": \"\",\n                            \"value\": \"\"\n                        }\n                    ],\n                    \"content\": \"Professionals will only be given your details once they\'ve sent you a quote.\",\n                    \"refreshOnChange\": false,\n                    \"tableView\": false,\n                    \"key\": \"html8\",\n                    \"type\": \"htmlelement\",\n                    \"input\": false\n                }\n            ],\n            \"input\": false,\n            \"tableView\": false,\n            \"breadcrumb\": \"none\",\n            \"buttonSettings\": {\n                \"previous\": true,\n                \"cancel\": false,\n                \"next\": true\n            },\n            \"collapsible\": false\n        },\n        {\n            \"title\": \"Page 9\",\n            \"label\": \"Page 9\",\n            \"type\": \"panel\",\n            \"key\": \"page9\",\n            \"components\": [\n                {\n                    \"label\": \"HTML\",\n                    \"tag\": \"h4\",\n                    \"attrs\": [\n                        {\n                            \"attr\": \"\",\n                            \"value\": \"\"\n                        }\n                    ],\n                    \"content\": \"What is your name?\",\n                    \"refreshOnChange\": false,\n                    \"tableView\": false,\n                    \"key\": \"html9\",\n                    \"type\": \"htmlelement\",\n                    \"input\": false\n                },\n                {\n                    \"label\": \"HTML\",\n                    \"attrs\": [\n                        {\n                            \"attr\": \"\",\n                            \"value\": \"\"\n                        }\n                    ],\n                    \"content\": \"Please tell us your name for the quotes:\",\n                    \"refreshOnChange\": false,\n                    \"tableView\": false,\n                    \"key\": \"html10\",\n                    \"type\": \"htmlelement\",\n                    \"input\": false\n                },\n                {\n                    \"label\": \"Name\",\n                    \"tableView\": true,\n                    \"validate\": {\n                        \"required\": true\n                    },\n                    \"key\": \"name\",\n                    \"type\": \"textfield\",\n                    \"input\": true\n                },\n                {\n                    \"label\": \"Send to all relevant professionals (recommended). I’m happy to receive this service in-person, online or remotely.\",\n                    \"tableView\": false,\n                    \"key\": \"sendToAllRelevantProfessionalsRecommendedImHappyToReceiveThisServiceInPersonOnlineOrRemotely\",\n                    \"type\": \"checkbox\",\n                    \"input\": true,\n                    \"defaultValue\": false\n                }\n            ],\n            \"input\": false,\n            \"tableView\": false,\n            \"breadcrumb\": \"none\",\n            \"buttonSettings\": {\n                \"previous\": true,\n                \"cancel\": false,\n                \"next\": true\n            },\n            \"collapsible\": false,\n            \"breadcrumbClickable\": true\n        }\n    ]\n}', 0, '', ''),
(25, 'login', '{\n    \"display\": \"form\",\n    \"components\": [\n        {\n            \"label\": \"HTML\",\n            \"tag\": \"h3\",\n            \"attrs\": [\n                {\n                    \"attr\": \"\",\n                    \"value\": \"\"\n                }\n            ],\n            \"content\": \"Login\",\n            \"refreshOnChange\": false,\n            \"tableView\": false,\n            \"key\": \"html\",\n            \"type\": \"htmlelement\",\n            \"input\": false\n        },\n        {\n            \"label\": \"Email\",\n            \"tableView\": true,\n            \"validate\": {\n                \"required\": true\n            },\n            \"key\": \"email\",\n            \"type\": \"email\",\n            \"input\": true\n        },\n        {\n            \"label\": \"Password\",\n            \"tableView\": false,\n            \"validate\": {\n                \"required\": true\n            },\n            \"key\": \"password\",\n            \"type\": \"password\",\n            \"input\": true,\n            \"protected\": true\n        },\n        {\n            \"label\": \"Remember Me\",\n            \"labelPosition\": \"left-right\",\n            \"optionsLabelPosition\": \"right\",\n            \"hideLabel\": true,\n            \"tableView\": false,\n            \"defaultValue\": {\n                \"\": false\n            },\n            \"values\": [\n                {\n                    \"label\": \"Remember Me\",\n                    \"value\": \"rememberMe\",\n                    \"shortcut\": \"\"\n                }\n            ],\n            \"key\": \"rememberMe\",\n            \"type\": \"selectboxes\",\n            \"input\": true,\n            \"inputType\": \"checkbox\"\n        },\n        {\n            \"label\": \"Login\",\n            \"showValidations\": false,\n            \"block\": true,\n            \"disableOnInvalid\": true,\n            \"tableView\": false,\n            \"key\": \"submit\",\n            \"type\": \"button\",\n            \"input\": true\n        },\n        {\n            \"html\": \"<p>Offering a service? <a href=\\\"http://localhost:4200/sellers/create\\\">Create a Pro account</a></p><p>Looking for a service? <a href=\\\"http://localhost:4200\\\">Get started</a></p>\",\n            \"label\": \"Content\",\n            \"refreshOnChange\": false,\n            \"tableView\": false,\n            \"key\": \"content\",\n            \"type\": \"content\",\n            \"input\": false\n        }\n    ]\n}', 0, '', ''),
(27, 'purchase credit', '{\n    \"display\": \"form\",\n    \"components\": [\n        {\n            \"html\": \"<h4 style=\\\"text-align:center;\\\"><strong>You are buying 50 credits</strong></h4><p style=\\\"text-align:center;\\\"><strong>£0.96 each, £48.00 total (ex VAT)</strong></p><p style=\\\"text-align:center;\\\"><strong>10 credits will be used to submit your details to Donna</strong></p>\",\n            \"label\": \"Content\",\n            \"refreshOnChange\": false,\n            \"tableView\": false,\n            \"key\": \"content\",\n            \"type\": \"content\",\n            \"input\": false\n        },\n        {\n            \"label\": \"Columns\",\n            \"columns\": [\n                {\n                    \"components\": [\n                        {\n                            \"label\": \" Card number \",\n                            \"placeholder\": \"**** **** **** ****\",\n                            \"inputMask\": \"9999 9999 9999 9999\",\n                            \"tableView\": true,\n                            \"validate\": {\n                                \"required\": true\n                            },\n                            \"key\": \"cardNumber\",\n                            \"type\": \"textfield\",\n                            \"input\": true,\n                            \"hideOnChildrenHidden\": false\n                        }\n                    ],\n                    \"width\": 12,\n                    \"offset\": 0,\n                    \"push\": 0,\n                    \"pull\": 0,\n                    \"size\": \"md\"\n                },\n                {\n                    \"components\": [\n                        {\n                            \"label\": \"Expiry date\",\n                            \"placeholder\": \"MM/YY\",\n                            \"inputMask\": \"99/99\",\n                            \"tableView\": true,\n                            \"validate\": {\n                                \"required\": true\n                            },\n                            \"key\": \"expiryDate\",\n                            \"type\": \"textfield\",\n                            \"input\": true,\n                            \"hideOnChildrenHidden\": false\n                        }\n                    ],\n                    \"width\": 6,\n                    \"offset\": 0,\n                    \"push\": 0,\n                    \"pull\": 0,\n                    \"size\": \"md\"\n                },\n                {\n                    \"components\": [\n                        {\n                            \"label\": \"CVC\",\n                            \"placeholder\": \"CVC\",\n                            \"tableView\": true,\n                            \"validate\": {\n                                \"required\": true,\n                                \"maxLength\": 4\n                            },\n                            \"key\": \"cvc\",\n                            \"type\": \"textfield\",\n                            \"input\": true,\n                            \"hideOnChildrenHidden\": false\n                        }\n                    ],\n                    \"size\": \"md\",\n                    \"width\": 6,\n                    \"offset\": 0,\n                    \"push\": 0,\n                    \"pull\": 0\n                }\n            ],\n            \"tableView\": false,\n            \"key\": \"columns\",\n            \"type\": \"columns\",\n            \"input\": false\n        },\n        {\n            \"label\": \"Purchase\",\n            \"showValidations\": false,\n            \"disableOnInvalid\": true,\n            \"tableView\": false,\n            \"key\": \"submit\",\n            \"type\": \"button\",\n            \"input\": true\n        }\n    ]\n}', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(11) NOT NULL,
  `lead_cost_credits` int(11) NOT NULL DEFAULT '10',
  `create_time` varchar(255) NOT NULL,
  `num_professionals_emailed` varchar(255) NOT NULL,
  `professional_hired_id` varchar(255) NOT NULL,
  `form_id` int(11) NOT NULL,
  `answers_json` text NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'lead'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `lead_cost_credits`, `create_time`, `num_professionals_emailed`, `professional_hired_id`, `form_id`, `answers_json`, `email_address`, `password`, `name`, `phone`, `type`) VALUES
(1, 10, '0', '0', '0', 0, '{\"whoIsSeekingToRecoverTheDebt\":\"A Business\",\"whatIsTheAmountOwed\":\"£500 - £1k\",\"howLongHasThisAmountBeenUnpaidFor\":\"6 - 12 months\",\"doYouAlreadyHaveACourtJudgementForThisDebt\":\"No - I would like help to obtain one\",\"whichOfTheFollowingDoesTheDebtRelateTo\":true,\"loanNotRepaid\":true,\"unpaidInvoiceS\":true,\"serviceProductProvidedNotOfAgreedStandard\":true,\"unpaidRent\":true,\"other\":false,\"email\":\"mayank@gmail.com\",\"iAmHappyToReceiveOccasionalMarketingEmailsFromBark\":true,\"phoneNumber\":\"(111) 111-1111\",\"name\":\"mayank\",\"sendToAllRelevantProfessionalsRecommendedImHappyToReceiveThisServiceInPersonOnlineOrRemotely\":true}', 'mayank@gmail.com', 'TbC@ha06', 'mayank', '(111) 111-1111', 'lead'),
(2, 10, '0', '0', '0', 0, '{\"whoIsSeekingToRecoverTheDebt\":\"A Business\",\"whatIsTheAmountOwed\":\"£1k - £5k\",\"howLongHasThisAmountBeenUnpaidFor\":\"3 - 6 months\",\"doYouAlreadyHaveACourtJudgementForThisDebt\":\"No - but I don\'t need help to obtain one\",\"whichOfTheFollowingDoesTheDebtRelateTo\":false,\"loanNotRepaid\":true,\"unpaidInvoiceS\":true,\"serviceProductProvidedNotOfAgreedStandard\":true,\"unpaidRent\":false,\"other\":false,\"email\":\"john@gmail.com\",\"iAmHappyToReceiveOccasionalMarketingEmailsFromBark\":false,\"phoneNumber\":\"(333) 333-3333\",\"name\":\"John Doe\",\"sendToAllRelevantProfessionalsRecommendedImHappyToReceiveThisServiceInPersonOnlineOrRemotely\":false}', 'john@gmail.com', 'cGIteOEP', 'John Doe', '(333) 333-3333', 'lead'),
(3, 10, '0', '0', '0', 0, '{\"whoIsSeekingToRecoverTheDebt\":\"An Individual\",\"whatIsTheAmountOwed\":\"£1k - £5k\",\"howLongHasThisAmountBeenUnpaidFor\":\"Less than a month\",\"doYouAlreadyHaveACourtJudgementForThisDebt\":\"Yes\",\"whichOfTheFollowingDoesTheDebtRelateTo\":false,\"loanNotRepaid\":false,\"unpaidInvoiceS\":false,\"serviceProductProvidedNotOfAgreedStandard\":false,\"unpaidRent\":true,\"other\":false,\"email\":\"richard@gmail.com\",\"iAmHappyToReceiveOccasionalMarketingEmailsFromBark\":false,\"phoneNumber\":\"(546) 456-4564\",\"name\":\"richard@gmail.com\",\"sendToAllRelevantProfessionalsRecommendedImHappyToReceiveThisServiceInPersonOnlineOrRemotely\":false}', 'richard@gmail.com', '$Zddp8q', 'richard@gmail.com', '(546) 456-4564', 'lead'),
(4, 10, '0', '0', '0', 0, '{\"whoIsSeekingToRecoverTheDebt\":\"An Individual\",\"whatIsTheAmountOwed\":\"up to  £500\",\"howLongHasThisAmountBeenUnpaidFor\":\"Less than a month\",\"doYouAlreadyHaveACourtJudgementForThisDebt\":\"Yes\",\"whichOfTheFollowingDoesTheDebtRelateTo\":true,\"loanNotRepaid\":false,\"unpaidInvoiceS\":false,\"serviceProductProvidedNotOfAgreedStandard\":false,\"unpaidRent\":false,\"other\":false,\"email\":\"test@gmaill.com\",\"iAmHappyToReceiveOccasionalMarketingEmailsFromBark\":true,\"phoneNumber\":\"(233) 223-2422\",\"name\":\"test\",\"sendToAllRelevantProfessionalsRecommendedImHappyToReceiveThisServiceInPersonOnlineOrRemotely\":false}', 'test@gmaill.com', '8UBlkwVk', 'test', '(233) 223-2422', 'lead'),
(5, 0, '0', '0', '0', 0, '{\"whoIsSeekingToRecoverTheDebt\":\"A Business\",\"whatIsTheAmountOwed\":\"£5k - £10k\",\"howLongHasThisAmountBeenUnpaidFor\":\"1 - 3 months\",\"doYouAlreadyHaveACourtJudgementForThisDebt\":\"No - I would like help to obtain one\",\"whichOfTheFollowingDoesTheDebtRelateTo\":false,\"loanNotRepaid\":false,\"unpaidInvoiceS\":false,\"serviceProductProvidedNotOfAgreedStandard\":true,\"unpaidRent\":false,\"other\":false,\"email\":\"nadeem.eway@gmail.com\",\"iAmHappyToReceiveOccasionalMarketingEmailsFromBark\":false,\"phoneNumber\":\"(324) 234-2342\",\"name\":\"nadeem\",\"sendToAllRelevantProfessionalsRecommendedImHappyToReceiveThisServiceInPersonOnlineOrRemotely\":false}', 'nadeem.eway@gmail.com', 'HsP0mZ$b', 'nadeem', '(324) 234-2342', 'lead'),
(6, 0, '0', '0', '0', 0, '{\"whoIsSeekingToRecoverTheDebt\":\"A Business\",\"whatIsTheAmountOwed\":\"£5k - £10k\",\"howLongHasThisAmountBeenUnpaidFor\":\"1 - 3 months\",\"doYouAlreadyHaveACourtJudgementForThisDebt\":\"No - I would like help to obtain one\",\"whichOfTheFollowingDoesTheDebtRelateTo\":false,\"loanNotRepaid\":false,\"unpaidInvoiceS\":false,\"serviceProductProvidedNotOfAgreedStandard\":true,\"unpaidRent\":false,\"other\":false,\"email\":\"nadeem.eway@gmail.com\",\"iAmHappyToReceiveOccasionalMarketingEmailsFromBark\":false,\"phoneNumber\":\"(324) 234-2342\",\"name\":\"nadeem\",\"sendToAllRelevantProfessionalsRecommendedImHappyToReceiveThisServiceInPersonOnlineOrRemotely\":false}', 'nadeem.eway@gmail.com', 'LX5IZm48', 'nadeem', '(324) 234-2342', 'lead');

-- --------------------------------------------------------

--
-- Table structure for table `leads_credits_purchased`
--

CREATE TABLE `leads_credits_purchased` (
  `id` int(11) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `professional_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `credits_used` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages_to_lead`
--

CREATE TABLE `messages_to_lead` (
  `id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `to_lead_id` int(11) NOT NULL,
  `from_professional_id` int(11) NOT NULL,
  `message_text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages_to_professional`
--

CREATE TABLE `messages_to_professional` (
  `id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `from_lead_id` int(11) NOT NULL,
  `to_professional_id` int(11) NOT NULL,
  `message_text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `my_posts`
--

CREATE TABLE `my_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `my_posts`
--

INSERT INTO `my_posts` (`id`, `title`, `body`) VALUES
(18, 'new post', 'new post body'),
(15, '', ''),
(17, 'loginform', 'ssdf'),
(16, '', ''),
(7, 'dssdfds', 'dsfsdfsdfsd'),
(10, 'dssdfdsnew', 'dsfsdfsdfsdnew'),
(14, 'ujjain', 'xzv'),
(19, 'bbbbbbbbb', 'bbbbbbbb'),
(20, 'fdsfsd', ''),
(21, 'dfdf', 'dfdf');

-- --------------------------------------------------------

--
-- Table structure for table `professionals`
--

CREATE TABLE `professionals` (
  `id` int(11) NOT NULL,
  `total_credits_purchased` varchar(255) NOT NULL,
  `credits_remaining` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `brief_description` text NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'professional'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `professionals`
--

INSERT INTO `professionals` (`id`, `total_credits_purchased`, `credits_remaining`, `company_name`, `name`, `phone`, `email_address`, `password`, `brief_description`, `create_time`, `type`) VALUES
(1, '0', '0', 'eway', 'Mayank', '(324) 234-2342', 'nadeem.eway@gmail.com', '123456', '', '2020-09-02T13:01:26.995Z', 'professional'),
(3, '0', '0', 'eway', 'rahul', '654654646', 'nadeemansari876@gmail.com', '123456', 'jhgj', '2020-09-02T13:01:26.995Z', 'professional'),
(4, '0', '0', 'eway', 'abhishek', '(738) 383-8383', 'abhishekjoshi.eway@gmail.com', 'kM@JscyT', '', '2020-09-03T12:27:15.114Z', 'professional'),
(5, '0', '0', 'dsafsdf', 'fsdafsadf', '(324) 234-2343', 'nadeem.eway@gmail.com', 'mdw3qEmN', '', '2020-09-04T12:21:11.725Z', 'professional');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `professional_id` int(11) NOT NULL,
  `review_text` text NOT NULL,
  `stars_int` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`) VALUES
(2, 'Debt Recovery & Collection');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `professional_id` varchar(11) NOT NULL,
  `payment_amount` varchar(255) NOT NULL,
  `credits_purchased` varchar(255) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `card_type` varchar(255) NOT NULL,
  `expiration` varchar(255) NOT NULL,
  `last_four_digits` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads_credits_purchased`
--
ALTER TABLE `leads_credits_purchased`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages_to_lead`
--
ALTER TABLE `messages_to_lead`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages_to_professional`
--
ALTER TABLE `messages_to_professional`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_posts`
--
ALTER TABLE `my_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `professionals`
--
ALTER TABLE `professionals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `leads_credits_purchased`
--
ALTER TABLE `leads_credits_purchased`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages_to_lead`
--
ALTER TABLE `messages_to_lead`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages_to_professional`
--
ALTER TABLE `messages_to_professional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `my_posts`
--
ALTER TABLE `my_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `professionals`
--
ALTER TABLE `professionals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
