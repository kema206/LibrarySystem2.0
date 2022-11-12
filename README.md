# LibrarySystem2.0
This version of our library system adds to our initial version 1 of our library system that can be found here: https://github.com/310g17/librarySystem</br>
Our initial goal still remains the same. Our team’s project is focused on the creation of a library system that primarily focuses on the borrowing feature of a library. The library system will be created as an app as we believe the mobility of a mobile device is handy for librarians that want to check and see book. Furthermore, our application is centred around 5 main features. Our primary feature will be the ability to check in and check out, this system will function around our book database that tracks our stock of books. Aside from borrowing and returning books, we also want to implement a simple filtering tool. There is another feature we decided to implement, which is the idea of an individual account. Users and administrators will have their own accounts, each with different access levels. Administrators have access to the addition and removal of borrowable books in the database of books. To support the library in terms of its security, we have decided to implement a tracking system for books. If a person has borrowed 2 books or an overdue book (books borrowed for over 2 weeks) they are unable to borrow more. </br>
The core functionalities of our system is still the same however, due to the previous systems limitations of using a .csv file to store our data we will transition into SQL for better code readability and overall performance. Furthermore, by using SQL we believe it will be easier to solve the issue of data storage. <br/>

Features changed or added include:<br/>
1. Addition of a filter feature<br/>
This feature was initially cut due to the constraints provided by a .csv system. Now, with the addition of SQL to our system, it's possible to use a relatively simple SELECT query to filter specific books. Filtering books would be a big deal in our system as it is integral for libraries to categorize and find books relatively fast. Even if it is just a simple filtering feature. <br/>

#SAMPLE OUTPUT
<br/>

2. Reprogramming older features (login, new account, add book, remove book) to suit our new SQL integration<br/>
This feature was changed due to the complexity of our previous system. The previous system heavily relied on the .csv readers and writers. This made our code extremely inefficient. The amount of reads and writes we had to do also convoluted the code and was relatively messy. </br>

#SAMPLE OUTPUT
<br/>
3. New GUI
Pairing the new SQL integration with the GUI also creates a better user experience as we're now adding buttons instead of relying on users typing (less errors). <br/>

#sample output
