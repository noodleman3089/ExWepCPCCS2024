using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Pages_AddWearable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showImage();
    }

    private void showImage()
    {
        string[] images = Directory.GetFiles(Server.MapPath("~/Images/Wearable"));

        ArrayList imageList = new ArrayList();
        foreach (string image in images)
        {
            string imageName = image.Substring(image.LastIndexOf(@"\") + 1);
            imageList.Add(imageName);
        }
        ddImage.DataSource = imageList;
        ddImage.DataBind();
    }

    private void clearTextField()
    {
        txtName.Text = "";
        txtPrice.Text = "";
        txtReview.Text = "";
    }

    protected void btnUploadImage_Click(object sender, EventArgs e)
    {
        try
        {
            string fileName = Path.GetFileName(FileUpload1.FileName);
            FileUpload1.SaveAs(Server.MapPath("~/Images/Wearable/" + fileName));
            lblResult.Text = "Image " + fileName + " sucessfully upload!!!";
            Page_Load(sender, e);
        }
        catch (Exception)
        {
            lblResult.Text = "Upload Failed !!!!";
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txtName.Text;
            string type = listType.SelectedItem.Text;
            double price = Convert.ToDouble(txtPrice.Text);
            string image = "../Images/Wearable/" + ddImage.SelectedValue;
            string review = txtReview.Text;

            Wearable wearable = new Wearable(name, type, price, image, review);
            ConnectionClass.AddWearable(wearable);

            lblResult.Text = "Upload Succesful !!!!";
            clearTextField();
        }
        catch (Exception)
        {
            lblResult.Text = "Upload Failed !!!!";
            clearTextField();
        }
    }
}