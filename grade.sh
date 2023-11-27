
CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Does the required file exist? (step 2)
if [ -f student-submission/ListExamples.java ]; then
   echo "ListExamples.java found." 

else 
    echo "Error: Required file not found in the submission."
    exit 1
fi

# Moving the file to the grading-area (step 3)

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area

echo "Files have been moved to grading-area." 

# Compile and give feedback (step 4)
cd grading-area/
javac -cp $CPATH *.java 

#Run tests and report grade (step 5)
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples

#copy the output to a file 

touch output.txt

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt

# use grep to find the output  

if [ grep -q "OK" output.txt ]; then 

    echo "Grade: Full points - A" 

else 

    echo "Grade: Incomplete - errors in running code" 
    exit 1
fi 
# Then, add here code to compile and run, and do any post-processing of the
# tests
