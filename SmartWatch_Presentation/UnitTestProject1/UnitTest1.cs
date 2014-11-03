using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;


namespace ProjectUnitTest
{
    [TestClass]
    public class UnitTest1
    {
        BusinessTier.Admin admin;


        public UnitTest1 ()
        {
            admin = new BusinessTier.Admin();
        }

        [TestMethod]
        public void TestIsMember ()
        {
            Assert.AreEqual(admin.isMember("D0001"), true);
        }

        [TestMethod]
        public void TestIsMemberByWrongID ()
        {
            Assert.AreEqual(admin.isMember("K0001"), false);
        }

        [TestMethod]
        public void TestIsMemeberByNullValue ()
        {
            Assert.AreEqual(admin.isMember(null), false);
        }

        [TestMethod]
        public void TestIsMemberByEmptyValue ()
        {
            string testRoleID = "";
            Assert.AreEqual(admin.isMember(testRoleID), false);
        }

        [TestMethod]
        public void TestAddCareTaker ()
        {
            admin.AddCareTaker("TestID", "TestName", "TestGender", "TestContact", 20);
            Assert.IsTrue(admin.isMember("TestID"));
        }

        [TestMethod]
        public void TestAddCareTakerWithNullValue ()
        {
            string testID = null;
            string testName = null;
            string testGender = null;
            string testContact = null;
            int testAge = 0;
            admin.AddCareTaker(testID, testName, testGender, testContact, testAge);
            Assert.AreEqual(admin.isMember(testID), false);
        }

        [TestMethod]
        public void TestAddCareTakerWithInvalidValue ()
        {
            string testID = "";
            string testName = "";
            string testGender = "";
            string testContact = "";
            int testAge = 2;
            admin.AddCareTaker(testID, testName, testGender, testContact, testAge);
            Assert.AreEqual(admin.isMember(testID), false);
        }

        [TestMethod]
        public void TestAddCareTakerWithInvalidAge ()
        {
            int testAge = -1;
            admin.AddCareTaker("TestID1", "TestName", "TestGender", "TestContact", testAge);
            Assert.AreEqual(admin.isMember("TestID1"), false);
        }

        [TestMethod]
        public void TestDeleteCaretaker ()
        {
            admin.AddCareTaker("TestID2", "TestName2", "TestGender2", "TestContact2", 20);
            admin.DeleteCareTaker("TestID2");
            Assert.AreEqual(admin.isMember("TestID2"), false);
        }

        [TestMethod]
        public void TestDeletCaretakerWithNullValue ()
        {
            string testID = null;
            admin.DeleteCareTaker(testID);
            Assert.AreEqual(admin.isMember(testID), false);
        }

        [TestMethod]
        public void TestDeleteCaretakerWithEmptyValue ()
        {
            string testID="";
            admin.DeleteCareTaker(testID);
            Assert.AreEqual(admin.isMember(testID), false);
        }

        [TestMethod]
        public void TestDeleteCaretakerWithInvalidValue ()
        {
            string testID="##";
            admin.DeleteCareTaker(testID);
            Assert.AreEqual(admin.isMember(testID), false);
        }

        [TestMethod]
        public void TestAddCareTakerAfterDelete ()
        {
            admin.AddCareTaker("TestID", "TestName", "TestGender", "TestContact", 20);
            admin.DeleteCareTaker("TestID");
            Assert.AreEqual(admin.isMember("TestID"), false);
        }


        [TestMethod]
        public void TestAddDoctor ()
        {
            admin.AddDoctor("Test_D1", "Test_Name", "male", 30);
            Assert.AreEqual(admin.isMember("Test_D1"), true);
        }

        [TestMethod]
        public void TestAddDoctorWithNullValue ()
        {
            admin.AddDoctor("TEST_D2", "Test_Name", null, 30);
            Assert.AreEqual(admin.isMember("TEST_D2"), false);
        }

        [TestMethod]
        public void TestAddDoctorWithInvalidValue ()
        {
            admin.AddDoctor("TEST_D3", "Test_Name", "male", -12);
            Assert.AreEqual(admin.isMember("TEST_D3"), false);
        }

        [TestMethod]
        public void TestDeleteDoctor ()
        {
            Assert.AreEqual(admin.isMember("TEST_D1"), true);
            admin.DeleteDoctor("TEST_D1");
            Assert.AreEqual(admin.isMember("TEST_D1"), false);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException), "A userId of null was inappropriately allowed.")]
        public void TestDeleteDoctorWithNullValue ()
        {
            string id = null;
            admin.DeleteDoctor(id);
        }
    }
}
