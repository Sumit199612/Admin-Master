<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CMS;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class CMSController extends Controller
{
    public function index()
    {
        Session::put('cms', 'cms');

        $cmsData = CMS::get()->toArray();
        return view('admin.pages.index')->with(compact('cmsData'));
    }

    public function create(Request $request, CMS $cms)
    {
        Session::put('cms', 'cms');
        if ($request->isMethod('post')) {
            $data = $request->all();

            $rules = [
                'title' => 'required|unique:c_m_s,title',
                'keyword' => 'required'
            ];

            $messages = [
                'title.required' => 'Please enter title',
                'keyword.required' => 'Please enter keyword',
            ];

            $validation = Validator::make($data, $rules, $messages);

            if ($validation->fails()) {
                return redirect()->back()->withInput()->withErrors($validation->messages());
            }

            if (!isset($data['image']) || empty($data['image'])) {
                $cmsImage = "";
            } else {
                $cmsImage = time() . '.' . $data['image']->extension();
                $data['image']->move(public_path('/uploads/cms'), $cmsImage);
            }

            $slug = Str::slug($data['title']);
            // dd($slug);
            $createCMS = new CMS;
            $createCMS->title = $data['title'];
            $createCMS->slug = $slug;
            $createCMS->keyword = $data['keyword'];
            $createCMS->description = $data['description'];
            $createCMS->image = $cmsImage;
            $createCMS->save();

            return redirect('admin/cms-index')->with('success', 'CMS added successfully');
        }
        return view('admin.pages.create');
    }

    public function update(Request $request, $slug, $id)
    {
        $cms = CMS::where(['slug' => $slug, 'id' => $id])->first();
        if($request->isMethod('post')){
            $data = $request->all();

            $validation = [
                'title' => ['required', 'string', 'max:255, unique:c_m_s,title,' . $slug],
                'keyword' => ['required', 'string', 'max:255']
            ];
            $validator = Validator::make($data, $validation);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator->getMessageBag());
            }

            if(!isset($data['image']) || empty($data['image'])){
                $cmsImage = $cms['image'];
            }else{
                $cmsImage = time() . '.' . $data['image']->extension();
                $data['image']->move(public_path('/uploads/cms'), $cmsImage);
            }

            if(!isset($data['description']) || empty($data['description'])){
                $description = $cms['description'];
            }else{
                $description = $data['description'];
            }

            $slugUpdate = Str::slug($data['title']);

            $updateCMS = CMS::where(['id' => $id])->update(['title' => $data['title'], 'keyword' => $data['keyword'], 'slug' => $slugUpdate, 'description' => $description, 'image' => $cmsImage]);
            return redirect('admin/cms-index')->with('success', 'CMS updated successfully.');
        }

        return view('admin.pages.create')->with(compact('cms'));
    }

    public function destroy($slug, $id){
        $cms = CMS::where('id',$id)->delete();
        return redirect()->back();
    }
}
