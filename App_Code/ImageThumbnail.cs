using System;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;


public class ImageThumbnail
{
    /// <summary>  
    /// 按比例缩小图片，自动计算高度  
    /// </summary>  
    /// <param name="strOldPic">源图文件名(包括路径)</param>  
    /// <param name="strNewPic">缩小后保存为文件名(包括路径)</param>  
    /// <param name="intWidth">缩小至宽度</param>  
    public void SmallPic(string PicPath, int intWidth)
    {
        System.Drawing.Bitmap objPic, objNewPic;
        try
        {
            objPic = new System.Drawing.Bitmap(PicPath);
            if (objPic.Width > intWidth)
            {
                double tempbl = (double)objPic.Width / objPic.Height;
                int intHeight = Convert.ToInt32(Convert.ToDouble(intWidth) / tempbl);
                objNewPic = new System.Drawing.Bitmap(objPic, intWidth, intHeight);
                objPic.Dispose();
                //objNewPic.Save(PicPath);
                SaveAsJPEG(objNewPic, PicPath, 90);  //90图片压缩品质
                objNewPic.Dispose();
            }
            else
            {
                objPic.Dispose();
            }
        }
        catch (Exception exp) { throw exp; }
        finally
        {
            objPic = null;
            objNewPic = null;
        }
    }

    /// <summary>
    /// 保存为JPEG格式，支持压缩质量选项
    /// </summary>
    /// <param name="bmp"></param>
    /// <param name="FileName"></param>
    /// <param name="Qty"></param>
    /// <returns></returns>
    public static bool SaveAsJPEG(System.Drawing.Bitmap bmp, string FileName, int Qty)
    {
        try
        {
            System.Drawing.Imaging.EncoderParameter p;
            System.Drawing.Imaging.EncoderParameters ps;
            ps = new System.Drawing.Imaging.EncoderParameters(1);
            p = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, Qty);
            ps.Param[0] = p;
            bmp.Save(FileName, GetCodecInfo("image/jpeg"), ps);
            return true;
        }
        catch
        {
            return false;
        }
    }
    /// <summary>
    /// 保存JPG时用
    /// </summary>
    /// <param name="mimeType"></param>
    /// <returns>得到指定mimeType的ImageCodecInfo</returns>
    private static System.Drawing.Imaging.ImageCodecInfo GetCodecInfo(string mimeType)
    {
        System.Drawing.Imaging.ImageCodecInfo[] CodecInfo = System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders();
        foreach (System.Drawing.Imaging.ImageCodecInfo ici in CodecInfo)
        {
            if (ici.MimeType == mimeType) return ici;
        }
        return null;
    }
}
