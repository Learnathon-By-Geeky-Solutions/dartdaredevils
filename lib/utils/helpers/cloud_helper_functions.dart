import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



/// Helper functions for cloud-related operations.
class TCloudHelperFunctions {

  static const String errorMessage = 'Something went wrong';

  /// Helper function to check the state of a single database record.
  ///
  /// Returns a Widget based on the state of the snapshot.
  /// If data is still loading, it returns a CircularProgressIndicator.
  /// If no data is found, it returns a generic "No Data Found" message.
  /// If an error occurs, it returns a generic error message.
  /// Otherwise, it returns null.
  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('No Data Found!'));
    }

    if (snapshot.hasError) {
      return const Center(child: Text(errorMessage));
    }

    return null;
  }

/// Helper function to check the state of multiple (list) database records.
///
/// Returns a Widget based on the state of the snapshot.
///
///
// If on error occurs, it returns a generic error message.
// Otherwise, it returns null.

  static Widget? checkMultiRecordState <T>({required AsyncSnapshot<List<T>> snapshot, Widget? loader, Widget? error, Widget? nothingFound}) {
  if (snapshot.connectionState == ConnectionState.waiting) {
  if (loader != null) return loader;
  return const Center(child: CircularProgressIndicator());
  }

  if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
  if (nothingFound != null) return nothingFound;
  return const Center(child: Text('No Data Found'));
  }

  if (snapshot.hasError) {
  if (error != null) return error;
  return const Center(child: Text(errorMessage));
  }

  return null;
  }

// Create a reference with an initial file path and name and retrieve the download URL.
  static Future<String> getURLFromFilePathAndName(
      String filePath, {
        FirebaseStorage? storage,
      }) async {
    try {
      final ref = (storage ?? FirebaseStorage.instance).ref().child(filePath);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw 'Firebase Storage Error: ${e.message}';
    } on PlatformException catch (e) {
      throw 'Platform Error: ${e.message}';
    } catch (e) {
      throw 'Unknown Error: $e';
    }
  }


}