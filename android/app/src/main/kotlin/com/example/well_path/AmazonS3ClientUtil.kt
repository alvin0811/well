package com.example.well_path

import com.amazonaws.auth.AWSCredentials
import com.amazonaws.regions.Region
import com.amazonaws.services.s3.AmazonS3Client
import com.amazonaws.services.s3.model.ObjectMetadata
import kotlinx.coroutines.suspendCancellableCoroutine
import java.io.Closeable
import java.io.File
import java.io.InputStream
import java.util.concurrent.ExecutorService
import kotlin.coroutines.resume
/**
 * Interface for a wrapper around various AmazonS3 operations.
 */
interface AmazonS3ClientUtil : Closeable {
    /**
     * Uploads [file] on S3 [bucket]
     */
    suspend fun upload(
            credentials: AWSCredentials,
            region: Region,
            bucket: String,
            key: String,
            file: File
    )
    /**
     * Uploads [inputStream] on S3 [bucket]
     */
    suspend fun upload(
            credentials: AWSCredentials,
            region: Region,
            bucket: String,
            key: String,
            contentType: String,
            inputStream: InputStream
    )
}
/**
 *  Implementation of [AmazonS3ClientUtil] which runs tasks on a [ExecutorService].
 */
class DefaultAmazonS3ClientUtil(private val executor: ExecutorService) : AmazonS3ClientUtil {
    override suspend fun upload(
            credentials: AWSCredentials,
            region: Region,
            bucket: String,
            key: String,
            file: File
    ) = suspendCancellableCoroutine<Unit> {
        val future = executor.submit {
            val amazonS3Client = AmazonS3Client(credentials, region)

            amazonS3Client.putObject(bucket, key, file)

            it.resume(Unit)
        }

        it.invokeOnCancellation {
            future.cancel(true)
        }
    }

    override suspend fun upload(
            credentials: AWSCredentials,
            region: Region,
            bucket: String,
            key: String,
            contentType: String,
            inputStream: InputStream
    ) = suspendCancellableCoroutine<Unit> {
        val future = executor.submit {
            val amazonS3Client = AmazonS3Client(credentials, region)

            val objectMetadata = ObjectMetadata();
            objectMetadata.contentType = contentType

            amazonS3Client.putObject(bucket, key, inputStream, objectMetadata)

            it.resume(Unit)
        }

        it.invokeOnCancellation {
            future.cancel(true)
        }
    }

    override fun close() {
        executor.shutdown()
    }
}