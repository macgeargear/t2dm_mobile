class User {
  final String id;
  final String firstname;
  final String lastname;
  final String gender;
  // final List<String> diseases;  // * change this to a list of Disease
  // final List<String> microbiomeFile; // * change this to a list of MicrobiomeFile
  // final List<String> vcfLinks;
  // final List<String> treatmentPeriod;
  final String profilePicture;
  final String status;
  final String birthDate;
  // final List<String> clinicalData; // * change this to a list of ClinicalData
  // final List<String> footData; // * change this to a list of FootData
  // final List<String> PCIF; // * change this to a list of PCIF
  // final List<String> vcfCompareResults; // * change this to a list of vcfCompareResults

  User({
    required this.gender,
    required this.profilePicture,
    required this.status,
    required this.birthDate,
    required this.id,
    required this.firstname,
    required this.lastname,
  });
}
