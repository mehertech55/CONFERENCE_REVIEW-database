INSERT INTO Author (emailAdd, firstName, lastName) VALUES

('lucy.williams@gmail.com', 'Lucy', 'Williams'),
('maria.garcia@gmail.com', 'Maria', 'Garcia'),
('john.smith@gmail.com', 'John', 'Smith'),
('abby.lee@gmail.com', 'Abby', 'Lee'),
('mary.parker@gmail.com', 'Mary', 'Parker');






INSERT INTO Paper (paperId, title, abstract, fileName, contactEmailAdd) VALUES
(1, 'Title1', NULL, NULL,'lucy.williams@gmail.com'),
(2, 'Title2', NULL, NULL, 'maria.garcia@gmail.com'),
(3, 'Title3', NULL, NULL,  'john.smith@gmail.com') ,
(4, 'Title4', NULL, NULL, 'abby.lee@gmail.com'),
(5, 'Title5', NULL, NULL, 'mary.parker@gmail.com');






INSERT INTO Reviewer (emailAdd, firstName, lastName, phoneNum, affiliation) VALUES
('emma.johnson@gmail.com', 'Emma', 'Johnson', NULL, NULL),
('david.cho@gmail.com', 'David', 'Cho', NULL, NULL),
('morgan.cooper@gmail.com', 'Morgan', 'Cooper', NULL, NULL),
('sarah.olson@gmail.com', 'Sarah', 'Olson', NULL, NULL),
('iris.hall@gmail.com', 'Iris', 'Hall', NULL, NULL);






INSERT INTO Review (reviewId, paperId, techMeritScore, readabilityScore, originalityScore, relevanceScore, reviewerEmailAdd, recommendation, authorComment, commiteeComment) VALUES
(1, 1, 8, 8, 8, 8, 'sarah.olson@gmail.com', 'I recommend', NULL, NULL),
(2, 1, 8, 8, 8, 8, 'david.cho@gmail.com', 'I recommend', NULL, NULL),
(3, 2, 8, 8, 8, 8, 'sarah.olson@gmail.com', 'I recommend', NULL, NULL),
(4, 2, 8, 8, 8, 8, 'iris.hall@gmail.com', 'I recommend', NULL, NULL),
(5, 2, 8, 8, 8, 8, 'morgan.cooper@gmail.com', NULL, NULL, NULL),
(6, 5, 8, 8, 8, 8, 'david.cho@gmail.com', NULL, NULL, NULL),
(7, 5, 8, 8, 8, 8, 'sarah.olson@gmail.com', NULL, NULL, NULL),
(8, 3, 8, 8, 8, 8, 'sarah.olson@gmail.com', NULL, NULL, NULL),
(9, 3, 8, 8, 8, 8, 'david.cho@gmail.com', NULL, NULL, NULL),
(10, 3, 8, 8, 8, 8, 'emma.johnson@gmail.com', NULL, NULL, NULL),
(11, 4, 8, 8, 8, 8, 'emma.johnson@gmail.com', NULL, NULL, NULL),
(12, 4, 8, 8, 8, 8, 'morgan.cooper@gmail.com', NULL, NULL, NULL);






INSERT INTO Topic (topicId, topicName) VALUES
(1, 'Topic1'),
(2, 'Topic2'),
(3, 'Topic3'),
(4, 'Topic4'),
(5, 'Topic5');






INSERT INTO reviewerTopics (EmailAdd, TopicId) VALUES
('sarah.olson@gmail.com', 1),
('david.cho@gmail.com', 1),
('iris.hall@gmail.com', 1),
('emma.johnson@gmail.com', 1),
('david.cho@gmail.com', 2),
('sarah.olson@gmail.com', 3),
('emma.johnson@gmail.com', 3),
('morgan.cooper@gmail.com', 3),
('david.cho@gmail.com', 5),
('emma.johnson@gmail.com', 5);
