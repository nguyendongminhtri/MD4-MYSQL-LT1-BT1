create table Students(
StudentId int(4) primary key auto_increment,
StudentName varchar(50),
Age int(4),
Email varchar(100)
);
create table classes (
ClassID int(4) primary key auto_increment,
ClassName varchar(50)
);
	create table classstudent(
    StudentID int(4),
    ClassID int(4),
    foreign key (StudentID) references students(StudentID),
    foreign key (ClassID) references classes(ClassID)
    );
    create table subjects(
    SubjectID int(4) primary key auto_increment,
    SubjectName varchar(255)
    );
    create table marks (
    mark int,
    SubjectID int,
    StudentID int,
    foreign key (SubjectID) references subjects(SubjectID),
    foreign key (StudentID) references students(StudentID)
    );
INSERT INTO students(StudentName, Age, Email) values 
    ('Nguyen Quang An', 45, 'an@yahoo.com');
    INSERT INTO classes (ClassName) values ('C0706L'), ('C0708G');
    INSERT INTO classstudent (StudentID, ClassID) values (1,1), (2,1), (3,2), (4,2),(5,2);
    INSERT INTO subjects(SubjectName) values ('SQL'), ('Java'), ('C'), ('Visual Basic');
    INSERT INTO marks (mark, SubjectID, StudentID) values (8,1,1), (4,2,1), (9,1,1), (7,1,3), 
    (3,1,4), (5,2,5), (8,3,3), (1,3,5), (3,2,4);
--     1. Hiển thị danh sách tất cả các học viên
SELECT * FROM students;
-- 2. Hiển thị danh sách tất cả các môn học
SELECT * FROM subjects;
-- 3. Tính điểm trung bình
SELECT avg(mark) from marks;
-- 4. Hiển thị môn học nào có học sinh thi được điểm cao nhất
SELECT SubjectName ,max(mark) as maxMark from subjects join marks on subjects.SubjectID = marks.SubjectID;
-- 5. Đánh số thứ tự của điểm theo chiều giảm
select row_number() over (order by mark desc) as 'Số Thứ Tự', mark from marks;
-- 6.	Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
alter table subjects modify column SubjectName varchar(255);
-- 7.	Cap nhat them dong chu « Day la mon hoc «  vao truoc cac ban ghi tren cot SubjectName trong bang Subjects-- 
update subjects set SubjectName = concat('<< Day la mon hoc >>', SubjectName);
SET SQL_SAFE_UPDATES = 0; /*Fix lỗi update */
-- 8.	Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table students add constraint check( age > 15 and age <50);
-- 9.	Loai bo tat ca quan he giua cac bang
-- ==> Xóa trực tiếp trên EER --> Phải chuột delete hoặc dùng lệnh xóa khóa ngoại
ALTER TABLE `table`
DROP FOREIGN KEY `id_name_fk`;
--  10.	Xoa hoc vien co StudentID la 1
delete from students where StudentID = 1;
-- 11.	Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table students add column status bit default (1);
-- 12.	Cap nhap gia tri Status trong bang Student thanh 0
update students set status = 0;

