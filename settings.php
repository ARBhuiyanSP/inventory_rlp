<?php 
include 'header.php';
/* if(!check_permission('settings-edit')){ 
    include("404.php");
    exit();
} */ 

// Update settings
if(isset($_POST['update'])){
    $name               = mysqli_real_escape_string($conn, $_POST['name']);
    $seo_title          = mysqli_real_escape_string($conn, $_POST['seo_title']);
    $seo_keyword        = mysqli_real_escape_string($conn, $_POST['seo_keyword']);
    $seo_description    = mysqli_real_escape_string($conn, $_POST['seo_description']);
    $company_contact    = mysqli_real_escape_string($conn, $_POST['company_contact']);
    $company_address    = mysqli_real_escape_string($conn, $_POST['company_address']);
    $from_name          = mysqli_real_escape_string($conn, $_POST['from_name']);
    $from_email         = mysqli_real_escape_string($conn, $_POST['from_email']);
    $facebook           = mysqli_real_escape_string($conn, $_POST['facebook']);
    $linkedin           = mysqli_real_escape_string($conn, $_POST['linkedin']);
    $twitter            = mysqli_real_escape_string($conn, $_POST['twitter']);
    $google             = mysqli_real_escape_string($conn, $_POST['google']);
    $copyright_text     = mysqli_real_escape_string($conn, $_POST['copyright_text']);
    $footer_text        = mysqli_real_escape_string($conn, $_POST['footer_text']);
    $terms              = mysqli_real_escape_string($conn, $_POST['terms']);
    $disclaimer         = mysqli_real_escape_string($conn, $_POST['disclaimer']);
    $google_analytics   = mysqli_real_escape_string($conn, $_POST['google_analytics']);

    // Fetch current row id
    $q = mysqli_query($conn, "SELECT id, logo, favicon FROM settings LIMIT 1");
    $current = mysqli_fetch_assoc($q);

    // logo upload
    $logo = $current['logo'];
    if(!empty($_FILES['logo']['name'])){
        $logo = "images/".time()."_".basename($_FILES["logo"]["name"]);
        move_uploaded_file($_FILES["logo"]["tmp_name"], $logo);
    }

    // favicon upload
    $favicon = $current['favicon'];
    if(!empty($_FILES['favicon']['name'])){
        $favicon = "images/".time()."_".basename($_FILES["favicon"]["name"]);
        move_uploaded_file($_FILES["favicon"]["tmp_name"], $favicon);
    }

    $update_sql = "UPDATE settings SET 
        name			='$name',
        seo_title		='$seo_title',
        seo_keyword		='$seo_keyword',
        seo_description	='$seo_description',
        company_contact	='$company_contact',
        company_address	='$company_address',
        from_name		='$from_name',
        from_email		='$from_email',
        facebook		='$facebook',
        linkedin		='$linkedin',
        twitter			='$twitter',
        google			='$google',
        copyright_text	='$copyright_text',
        footer_text		='$footer_text',
        terms			='$terms',
        disclaimer		='$disclaimer',
        google_analytics='$google_analytics',
        logo			='$logo',
        favicon			='$favicon',
        updated_at=NOW()
        WHERE id=".$current['id'];

    if(mysqli_query($conn, $update_sql)){
        // redirect to same page with success flag
        header("Location: settings.php?success=1");
        exit();
    } else {
        echo "<div class='alert alert-danger'>Error updating settings: ".mysqli_error($conn)."</div>";
    }
}

// Fetch current settings again
$query = "SELECT * FROM settings LIMIT 1";
$result = mysqli_query($conn, $query);
$settings = mysqli_fetch_assoc($result);

if(isset($_GET['success'])){
    echo "<div class='alert alert-success'>Settings updated successfully!</div>";
}
?>

<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Settings</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-cog"></i>
            Site Settings
        </div>
        <div class="card-body">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Site Name</label>
                    <input type="text" name="name" value="<?= $settings['name']; ?>" class="form-control" required>
                </div>

                <div class="form-group">
                    <label>Logo</label><br>
                    <?php if($settings['logo']){ ?>
                        <img src="<?= $settings['logo']; ?>" height="50"><br>
                    <?php } ?>
                    <input type="file" name="logo" class="form-control">
                </div>

                <div class="form-group">
                    <label>Favicon</label><br>
                    <?php if($settings['favicon']){ ?>
                        <img src="<?= $settings['favicon']; ?>" height="30"><br>
                    <?php } ?>
                    <input type="file" name="favicon" class="form-control">
                </div>

                <div class="form-group">
                    <label>SEO Title</label>
                    <input type="text" name="seo_title" value="<?= $settings['seo_title']; ?>" class="form-control">
                </div>

                <div class="form-group">
                    <label>SEO Keywords</label>
                    <input type="text" name="seo_keyword" value="<?= $settings['seo_keyword']; ?>" class="form-control">
                </div>

                <div class="form-group">
                    <label>SEO Description</label>
                    <textarea name="seo_description" class="form-control"><?= $settings['seo_description']; ?></textarea>
                </div>

                <div class="form-group">
                    <label>Company Contact</label>
                    <input type="text" name="company_contact" value="<?= $settings['company_contact']; ?>" class="form-control">
                </div>

                <div class="form-group">
                    <label>Company Address</label>
                    <textarea name="company_address" class="form-control"><?= $settings['company_address']; ?></textarea>
                </div>

                <div class="form-group">
                    <label>From Name</label>
                    <input type="text" name="from_name" value="<?= $settings['from_name']; ?>" class="form-control">
                </div>

                <div class="form-group">
                    <label>From Email</label>
                    <input type="email" name="from_email" value="<?= $settings['from_email']; ?>" class="form-control">
                </div>

                <div class="form-group">
                    <label>Facebook</label>
                    <input type="text" name="facebook" value="<?= $settings['facebook']; ?>" class="form-control">
                </div>

                <div class="form-group">
                    <label>LinkedIn</label>
                    <input type="text" name="linkedin" value="<?= $settings['linkedin']; ?>" class="form-control">
                </div>

                <div class="form-group">
                    <label>Twitter</label>
                    <input type="text" name="twitter" value="<?= $settings['twitter']; ?>" class="form-control">
                </div>

                <div class="form-group">
                    <label>Google+</label>
                    <input type="text" name="google" value="<?= $settings['google']; ?>" class="form-control">
                </div>

                <div class="form-group">
                    <label>Copyright Text</label>
                    <input type="text" name="copyright_text" value="<?= $settings['copyright_text']; ?>" class="form-control">
                </div>

                <div class="form-group">
                    <label>Footer Text</label>
                    <textarea name="footer_text" class="form-control"><?= $settings['footer_text']; ?></textarea>
                </div>

                <div class="form-group">
                    <label>Terms</label>
                    <textarea name="terms" class="form-control"><?= $settings['terms']; ?></textarea>
                </div>

                <div class="form-group">
                    <label>Disclaimer</label>
                    <textarea name="disclaimer" class="form-control"><?= $settings['disclaimer']; ?></textarea>
                </div>

                <div class="form-group">
                    <label>Google Analytics Code</label>
                    <textarea name="google_analytics" class="form-control"><?= $settings['google_analytics']; ?></textarea>
                </div>

                <button type="submit" name="update" class="btn btn-primary">Update Settings</button>
            </form>
        </div>
    </div>
</div>

<?php include 'footer.php'; ?>
